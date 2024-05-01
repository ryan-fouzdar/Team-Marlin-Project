import firebase_admin
from firebase_admin import credentials, firestore
import pandas as pd

cred = credentials.Certificate("./flutter_application_1/aggiebites-firebase-adminsdk-n3snx-34ecce3cd4.json")
firebase_admin.initialize_app(cred)
db = firestore.client()

# Read CSV with low_memory option set to False
df = pd.read_csv('ms_annual_data_2022.csv', low_memory=False)

# Upload to Firestore
def upload_data_to_firestore(collection_name, data):
    for index, row in data.iterrows():
        doc_ref = db.collection(collection_name).document()
        doc_ref.set(row.to_dict())
        print(f'Document added with ID: {doc_ref.id}')

upload_data_to_firestore('meals', df)