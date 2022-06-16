package com.example.authproject;

import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.example.authproject.databinding.ActivityLoginBinding;

public class LoginActivity extends AppCompatActivity {

    ActivityLoginBinding binding;
    DatabaseHelper databaseHelper;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityLoginBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());
        databaseHelper = new DatabaseHelper(this);
        binding.loginButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String githubName = binding.loginGithubName.getText().toString();
                String password = binding.loginPassword.getText().toString();
                if(githubName.equals("")||password.equals(""))
                    Toast.makeText(LoginActivity.this, "Todos campos são obrigatórios!", Toast.LENGTH_SHORT).show();
                else{
                    Boolean checkCredentials = databaseHelper.checkUserPassword(githubName, password);if (checkCredentials) {
                        Toast.makeText(LoginActivity.this, "Logado com sucesso!", Toast.LENGTH_SHORT).show();

                        Cursor userCursor = databaseHelper.getUserData(githubName);
                        if (userCursor != null) {
                            try {
                                if (userCursor.moveToFirst()) {
                                    int emailIndex = userCursor.getColumnIndex("email");

                                    if (emailIndex != -1) {
                                        String email = userCursor.getString(emailIndex);

                                        binding.loginGithubName.setText("");
                                        binding.loginPassword.setText("");
                                        binding.loginButton.post(() -> {
                                            Intent intent = new Intent(LoginActivity.this, MainActivity.class);
                                            intent.putExtra("githubName", githubName);
                                            startActivity(intent);
                                        });
                                    } else {
                                        Toast.makeText(LoginActivity.this, "Erro: Campo 'email' não encontrado no banco de dados.", Toast.LENGTH_SHORT).show();
                                    }
                                } else {
                                    Toast.makeText(LoginActivity.this, "Erro: Usuário não encontrado no banco de dados.", Toast.LENGTH_SHORT).show();
                                }
                            } finally {
                                userCursor.close();
                            }
                        } else {
                            Toast.makeText(LoginActivity.this, "Erro: Cursor nulo ao buscar dados do usuário.", Toast.LENGTH_SHORT).show();
                        }
                    } else {
                        Toast.makeText(LoginActivity.this, "Credenciais inválidas!", Toast.LENGTH_SHORT).show();
                    }

                }
            }
        });
        binding.loginRedirectText.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(LoginActivity.this, SignupActivity.class);
                startActivity(intent);
            }
        });
    }
}