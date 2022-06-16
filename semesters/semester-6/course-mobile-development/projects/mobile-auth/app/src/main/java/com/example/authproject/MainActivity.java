package com.example.authproject;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.bumptech.glide.Glide;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;import java.text.ParseException;

public class MainActivity extends AppCompatActivity {

    private TextView githubNameTextView;
    private Button connectApiButton;
    private ImageView githubAvatarImageView;
    private LinearLayout dataContainer;
    private ProgressBar loadingProgressBar;
    private TextView bioTextView;
    private String githubName;
    private boolean isDataLoaded = false;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ImageButton backButton = findViewById(R.id.backButton);
        githubName = getIntent().getStringExtra("githubName");

        githubNameTextView = findViewById(R.id.githubNameTextView);
        githubNameTextView.setText(githubName);

        connectApiButton = findViewById(R.id.connectApiButton);
        githubAvatarImageView = findViewById(R.id.githubAvatarImageView);
        dataContainer = findViewById(R.id.githubDataContainer);
        loadingProgressBar = findViewById(R.id.loadingProgressBar);
        bioTextView = findViewById(R.id.bioTextView);

        if (githubName != null && !githubName.isEmpty()) {
            loadInitialData();
        }

        connectApiButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (githubName == null || githubName.isEmpty()) {
                    Toast.makeText(MainActivity.this, "Nome do usuário inválido!", Toast.LENGTH_SHORT).show();
                    return;
                }

                if (isDataLoaded) {
                    return;
                }

                isDataLoaded = true;
                loadingProgressBar.setVisibility(View.VISIBLE);
                dataContainer.setVisibility(View.GONE);

                connectApiButton.setVisibility(View.GONE);

                String apiUrl = "https://api.github.com/users/" + githubName;
                OkHttpClient client = new OkHttpClient();
                Request request = new Request.Builder()
                        .url(apiUrl)
                        .addHeader("User-Agent", "AuthProject-App")
                        .build();

                client.newCall(request).enqueue(new Callback() {
                    @Override
                    public void onFailure(Call call, IOException e) {
                        runOnUiThread(() -> {
                            loadingProgressBar.setVisibility(View.GONE);
                            Toast.makeText(MainActivity.this, "Erro ao conectar à API", Toast.LENGTH_SHORT).show();
                            Log.e("MainActivity", "Erro na requisição: " + e.getMessage());
                        });
                    }

                    @Override
                    public void onResponse(Call call, Response response) throws IOException {
                        if (response.isSuccessful()) {
                            try {
                                String responseBody = response.body().string();
                                JSONObject jsonObject = new JSONObject(responseBody);

                                String name = jsonObject.optString("name", "N/A");
                                String followers = jsonObject.optString("followers", "N/A");
                                String publicRepos = jsonObject.optString("public_repos", "0");
                                String location = jsonObject.optString("location", "N/A");
                                String company = jsonObject.optString("company", "N/A");

                                runOnUiThread(() -> {
                                    loadingProgressBar.setVisibility(View.GONE);
                                    dataContainer.setVisibility(View.VISIBLE);

                                    LinearLayout horizontalLayout = new LinearLayout(MainActivity.this);
                                    horizontalLayout.setOrientation(LinearLayout.HORIZONTAL);
                                    horizontalLayout.setPadding(16, 16, 16, 16);

                                    addToHorizontalLayout(horizontalLayout, R.drawable.baseline_people_alt_24, followers, " seguidores");
                                    addToHorizontalLayout(horizontalLayout, R.drawable.baseline_collections_bookmark_24, publicRepos, " repositórios");

                                    dataContainer.addView(horizontalLayout);

                                    addToContainer(dataContainer, R.drawable.baseline_person_24, name);
                                    addToContainer(dataContainer, R.drawable.baseline_business_24, company);
                                    addToContainer(dataContainer, R.drawable.baseline_location_on_24, location);
                                });

                            } catch (JSONException e) {
                                runOnUiThread(() -> {
                                    loadingProgressBar.setVisibility(View.GONE);
                                    Toast.makeText(MainActivity.this, "Erro ao processar JSON", Toast.LENGTH_SHORT).show();
                                    Log.e("MainActivity", "Erro ao processar JSON: " + e.getMessage());
                                });
                            }
                        } else {
                            runOnUiThread(() -> {
                                loadingProgressBar.setVisibility(View.GONE);
                                Toast.makeText(MainActivity.this, "Erro: " + response.message(), Toast.LENGTH_SHORT).show();
                                Log.e("MainActivity", "Erro HTTP: " + response.message() + " - Código: " + response.code());
                            });
                        }
                    }

                });
            }
        });
        backButton.setOnClickListener(v -> finish());
    }

    private void loadInitialData() {
        if (githubName != null && !githubName.isEmpty()) {
            String avatarUrl = "https://github.com/" + githubName + ".png";
            Glide.with(this)
                    .load(avatarUrl)
                    .skipMemoryCache(true)
                    .circleCrop()
                    .placeholder(R.drawable.background)
                    .error(R.drawable.ic_launcher_background)
                    .into(githubAvatarImageView);

            String apiUrl = "https://api.github.com/users/" + githubName;
            OkHttpClient client = new OkHttpClient();
            Request request = new Request.Builder()
                    .url(apiUrl)
                    .addHeader("User-Agent", "AuthProject-App")
                    .build();

            client.newCall(request).enqueue(new Callback() {
                @Override
                public void onFailure(Call call, IOException e) {
                    runOnUiThread(() -> {
                        Toast.makeText(MainActivity.this, "Erro ao carregar dados iniciais", Toast.LENGTH_SHORT).show();
                        Log.e("MainActivity", "Erro na requisição: " + e.getMessage());
                    });
                }

                @Override
                public void onResponse(Call call, Response response) throws IOException {
                    if (response.isSuccessful()) {
                        try {
                            String responseBody = response.body().string();
                            JSONObject jsonObject = new JSONObject(responseBody);

                            String bio = jsonObject.optString("bio", "N/A");

                            runOnUiThread(() -> {
                                bioTextView.setText(bio);
                                bioTextView.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
                                bioTextView.setVisibility(View.VISIBLE);
                            });

                        } catch (JSONException e) {
                            runOnUiThread(() -> {
                                Toast.makeText(MainActivity.this, "Erro ao processar dados", Toast.LENGTH_SHORT).show();
                                Log.e("MainActivity", "Erro ao processar JSON: " + e.getMessage());
                            });
                        }
                    }
                }
            });
        }
    }

    private void addToHorizontalLayout(LinearLayout container, int iconResId, String value, String name) {
        LinearLayout horizontalLayout = new LinearLayout(this);
        horizontalLayout.setOrientation(LinearLayout.HORIZONTAL);
        horizontalLayout.setPadding(0, 0, 64, 0);

        ImageView icon = new ImageView(this);
        icon.setColorFilter(getResources().getColor(R.color.gray_400));
        icon.setImageResource(iconResId);
        horizontalLayout.addView(icon);

        TextView valueTextView = new TextView(this);
        valueTextView.setText(value);
        valueTextView.setTextColor(getResources().getColor(R.color.white));
        valueTextView.setPadding(8, 0, 0, 0);
        valueTextView.setTextSize(16);
        horizontalLayout.addView(valueTextView);

        TextView nameTextView = new TextView(this);
        nameTextView.setText(name);
        nameTextView.setTextColor(getResources().getColor(R.color.gray_400));
        nameTextView.setPadding(8, 0, 0, 0);
        horizontalLayout.addView(nameTextView);

        container.addView(horizontalLayout);
    }

    private void addToContainer(LinearLayout container, int iconResId, String value) {
        LinearLayout verticalLayout = new LinearLayout(this);
        verticalLayout.setOrientation(LinearLayout.HORIZONTAL);
        verticalLayout.setPadding(8, 8, 8, 8);

        // Ícone
        ImageView icon = new ImageView(this);
        icon.setColorFilter(getResources().getColor(R.color.gray_400));
        icon.setImageResource(iconResId);
        verticalLayout.addView(icon);

        // Valor - branco
        TextView valueTextView = new TextView(this);
        valueTextView.setTextColor(getResources().getColor(R.color.white));
        valueTextView.setText(value);
        valueTextView.setTextSize(16);
        valueTextView.setPadding(16, 0, 0, 0);
        verticalLayout.addView(valueTextView);

        container.addView(verticalLayout);
    }

}
