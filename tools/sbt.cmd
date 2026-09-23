@echo off
rem ---------------------------------------------------------------------------
rem sbt 启动器包装脚本：在「当前目录」里启动 sbt。
rem
rem 用法：先 cd 到工程目录，再调用本脚本，例如
rem     cd D:\CPU\v0
rem     ..\tools\sbt.cmd run
rem
rem 本脚本需要同目录下的 sbt-launch.jar（约 3.6 MB，故意不提交，见 .gitignore）。
rem 重新下载（走阿里云镜像）：
rem     curl.exe -L -o sbt-launch.jar https://maven.aliyun.com/repository/public/org/scala-sbt/sbt-launch/1.12.4/sbt-launch-1.12.4.jar
rem 校验（SHA1 应为 33f94132d8a45c56b1d8ee3ed0de5628e0c61c88）：
rem     certutil -hashfile sbt-launch.jar SHA1
rem ---------------------------------------------------------------------------

if not defined JAVA_HOME (echo [sbt.cmd] JAVA_HOME is not set. & exit /b 1)
if not exist "%~dp0sbt-launch.jar" (echo [sbt.cmd] sbt-launch.jar not found next to this script. & exit /b 1)

"%JAVA_HOME%\bin\java.exe" -Xmx2G -jar "%~dp0sbt-launch.jar" %*
