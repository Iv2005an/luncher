package com.example.luncher

import android.app.Application

import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
  override fun onCreate() {
    super.onCreate()
    MapKitFactory.setApiKey(BuildConfig.YANDEX_MAPKIT_API_KEY)
  }
}