#!/bin/bash
AUTHORIZATION_CODE="hYzLg16oN93PEUtzrxUS4QDaS4qRN64m2jzniH9etxxLhDyLenjj3gAAAAQKPCQgAAABlVfKtE-nsOtctwzlGQ"
# curl -v -X POST "https://kauth.kakao.com/oauth/token" \
#   -d "grant_type=authorization_code" \
#   -d "client_id=$KAKAO_TEST_API_KEY" \
#   -d "redirect_uri=http://localhost:8080" \
#   -d "code=$AUTHORIZATION_CODE" \
#   -H "Content-Type: application/x-www-form-urlencoded"


# echo "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=${KAKAO_TEST_API_KEY}&redirect_uri=http://localhost:8080"

UUID="1205103"
# curl -v -X GET "https://kapi.kakao.com/v1/api/talk/friends" \
#   -H "Authorization: Bearer $KAKAO_ACCESS_TOKEN" \
#   -H "Content-Type: application/x-www-form-urlencoded"

curl -v -X POST "https://kapi.kakao.com/v1/api/talk/friends/message/send" \
  -H "Authorization: Bearer $KAKAO_ACCESS_TOKEN" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "receiver_uuids=[\"${UUID}\"]" \
  -d "template_id=117986"
  # -d 'template_object={"object_type":"text","text":"Hello from Kakao API!","link":{"web_url":"https://yourwebsite.com"}}'

  curl -X POST "https://kapi.kakao.com/v2/api/talk/memo/default/send" \
	-H "Content-Type: application/x-www-form-urlencoded" \
	-H "Authorization: Bearer $KAKAO_ACCESS_TOKEN"
	-d 'template_object={"object_type":"text","text":"Hello from Kakao API!","link":{"web_url":"https://yourwebsite.com"}}'
