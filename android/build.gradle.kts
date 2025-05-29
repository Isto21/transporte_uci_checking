allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
rootProject.buildDir = File(rootProject.buildDir, "../../build")

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    afterEvaluate {
        project.extensions.configure<com.android.build.gradle.BaseExtension> {
            if (namespace == null) namespace = project.group.toString()
            compileSdkVersion(34)
            buildToolsVersion("34.0.0") // Usar método en lugar de propiedad
        }
    }
}
subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}