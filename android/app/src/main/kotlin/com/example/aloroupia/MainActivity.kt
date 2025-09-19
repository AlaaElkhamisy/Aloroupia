package com.example.aloroupia

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.Environment
import android.content.ContentValues
import android.provider.MediaStore
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.OutputStream
import java.io.IOException

class MainActivity : FlutterActivity() {
    private val CHANNEL = "gallery_saver"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "saveImage" -> {
                    val imageData = call.argument<ByteArray>("imageData")
                    if (imageData != null) {
                        val success = saveImageToGallery(imageData)
                        if (success) {
                            result.success(true)
                        } else {
                            result.error("ERROR", "Failed to save image", null)
                        }
                    } else {
                        result.error("ERROR", "Image data is null", null)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun saveImageToGallery(imageData: ByteArray): Boolean {
        return try {
            val bitmap = BitmapFactory.decodeByteArray(imageData, 0, imageData.size)
            val contentValues = ContentValues().apply {
                put(MediaStore.Images.Media.DISPLAY_NAME, "image_${System.currentTimeMillis()}.jpg")
                put(MediaStore.Images.Media.MIME_TYPE, "image/jpeg")
                if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.Q) {
                    put(MediaStore.Images.Media.RELATIVE_PATH, Environment.DIRECTORY_PICTURES)
                }
            }

            val resolver = applicationContext.contentResolver
            val uri = resolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, contentValues)
            uri?.let {
                val outputStream: OutputStream? = resolver.openOutputStream(uri)
                outputStream?.use { stream ->
                    bitmap.compress(Bitmap.CompressFormat.JPEG, 100, stream)
                }
                true
            } ?: false
        } catch (e: IOException) {
            e.printStackTrace()
            false
        }
    }
}
