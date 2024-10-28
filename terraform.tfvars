# terraform.tfvars
railway_api_key = "92570711-e00a-4928-848d-c45f8503977d"
go_env_vars = {
  MAILTRAP_HOST      = "sandbox.smtp.mailtrap.io"
    MAILTRAP_PORT      = "25"
    MAILTRAP_USERNAME  = "9145ccd8e3e3c7"
    MAILTRAP_PASSWORD  = "4c5d0e6a1e71ad"
    MAILTRAP_FROM      = "no-reply@carsharing.com"
    JWT_SECRET         = "super_secure_jwt_key"
    CONNECTIONSTRING   = "host=autorack.proxy.rlwy.net port=40198 user=postgres dbname=railway sslmode=disable password=CefcTuRhTOUTreppwZCDJhNccyqZliyS"
}

nest_env_vars = {
 FIREBASE_PROJECT_ID          = "nest-api-push"
    FIREBASE_PRIVATE_KEY_ID      = "6515a4e6808180e46fe0550b87dfc3b5b4888921"
    FIREBASE_CLIENT_EMAIL        = "firebase-adminsdk-h04jk@nest-api-push.iam.gserviceaccount.com"
    FIREBASE_CLIENT_ID           = "115915219747972674507"
    FIREBASE_CLIENT_X509_CERT_URL= "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-h04jk%40nest-api-push.iam.gserviceaccount.com"
    BACK_END                     = "https://go-api-staging.up.railway.app"
    API_KEY                      = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IiIsImlhdCI6MTcyODI1OTEzMH0.dflSX1RWXfqps5Q8iTGGbAxhutKdyl52vh4YknDHM2c"
  }
