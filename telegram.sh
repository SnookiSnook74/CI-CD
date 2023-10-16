#!/bin/bash

STAGE_TYPE=$1
STATUS=$CI_JOB_STATUS

BOT_TOKEN="6427735591:AAFOxOxM-CmT-pPJxJ0NuImT4Mmg-jcelMU"
CHAT_ID="319761502"

sleep 5

if [ "$STATUS" == "success" ]; then
  MESSAGE="✅ Стадия $STAGE_TYPE 👉$CI_JOB_NAME👈 успешно завершена ✅ $CI_PROJECT_URL/pipelines"
else
  MESSAGE="🚫 Стадия $STAGE_TYPE 👉$CI_JOB_NAME👈 завершилась с ошибкой! 🚫 $CI_PROJECT_URL/pipelines"
fi

curl -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" -d chat_id=$CHAT_ID -d text="$MESSAGE"
