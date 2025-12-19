allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

// Workaround for Isar 3 on AGP 8+ (Namespace) and dependency compatibility (lStar)
subprojects {
    val androidPlugins = listOf("com.android.library", "com.android.application")
    androidPlugins.forEach { pluginId ->
        plugins.withId(pluginId) {
            val android = extensions.findByName("android")
            if (android != null) {
                // 1. Set Namespace (AGP 8+ requirement)
                try {
                    val setNamespace = android.javaClass.getMethod("setNamespace", String::class.java)
                    val getNamespace = android.javaClass.getMethod("getNamespace")
                    
                    if (getNamespace.invoke(android) == null) {
                        val group = project.group.toString()
                        val namespace = if (group.isNotEmpty() && group != "null") group else "com.example.${project.name}"
                        setNamespace.invoke(android, namespace)
                    }
                } catch (e: Exception) {
                   // Ignore namespace errors
                }
                
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
