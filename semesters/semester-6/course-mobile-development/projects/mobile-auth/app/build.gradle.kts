plugins {
    alias(libs.plugins.android.application)
}

android {
    namespace = "com.example.authproject"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.example.authproject"
        minSdk = 24
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
    buildFeatures{
        viewBinding = true
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }
}

dependencies {
    annotationProcessor("com.github.bumptech.glide:compiler:4.15.1")
    implementation("com.github.bumptech.glide:glide:4.15.1")
    implementation("androidx.navigation:navigation-ui:2.8.4")
    implementation("androidx.navigation:navigation-fragment:2.8.4")
    implementation("com.squareup.okhttp3:okhttp:4.11.0")
    implementation(libs.appcompat)
    implementation(libs.material)
    implementation(libs.activity)
    implementation(libs.constraintlayout)
    testImplementation(libs.junit)
    androidTestImplementation(libs.ext.junit)
    androidTestImplementation(libs.espresso.core)
}