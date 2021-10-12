RTSP://username:password@ipcameraIP:554/stream1
RTSP://username:password@ipcameraIP:554/stream2

taskkill /f /im "vlc.exe"
start vlc -vvv -Idummy rtsp://login:password@ipcameraIP/streaming/channels/2/preview --sout #transcode{vcodec=MJPG,venc=ffmpeg{strict=1},fps=10,width=640,height=360}:standard{access=http{mime=multipart/x-mixed-replace;boundary=--7b3cc56e5f51db803f790dad720ed50a},mux=mpjpeg,dst=:9911/}
start vlc -vvv -Idummy rtsp://login:password@ipcameraIP/streaming/channels/2/preview --sout #transcode{vcodec=MJPG,venc=ffmpeg{strict=1},fps=10,width=640,height=360}:standard{access=http{mime=multipart/x-mixed-replace;boundary=--7b3cc56e5f51db803f790dad720ed50a},mux=mpjpeg,dst=:9912/}

