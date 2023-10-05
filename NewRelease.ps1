
Copy-Item -Path "c:\dev\PhoneAssistant\Publish" -Destination "P:\ICTS\Mobile Phones\PhoneAssistant\Application\v0.3.9.290" -Recurse

Copy-Item -Path "P:\ICTS\Mobile Phones\PhoneAssistant\Application\v0.3.9.290\*" -Destination "$ENV:UserProfile\AppData\Local\PhoneAssistant"

# Copy-Item -Path "c:\dev\PhoneAssistant\Publish\*" -Destination "$ENV:UserProfile\AppData\Local\PhoneAssistant"