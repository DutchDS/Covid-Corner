import uuid
import datetime

def create_visit_id():
    myTEMP_ID = str(uuid.uuid4())
    myLen=len(myTEMP_ID)

    COMPANY_ID = 12345678
    TIME_ID = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
    TEMP_ID = myTEMP_ID[-12:myLen]

    # VISIT_ID = str(COMPANY_ID) + '-' + str(TIME_ID)  + '-' + TEMP_ID
    VISIT_ID = str(TIME_ID)  + '-' + TEMP_ID

    print(VISIT_ID)
    
    return VISIT_ID

# VISIT_ID = create_visit_id()
# print(VISIT_ID)



