import grequests
from faker import Factory

fake = Factory.create()

def process_response(response, **kwargs):
    # import ipdb; ipdb.set_trace()
    print response.status_code
    print response.json()

async_list = []

# Django
for _ in range(100):
    action_item = grequests.post(
        'http://localhost:8000/api/items/',
        data={"text": fake.sentence()},
        hooks={'response' : process_response})
    async_list.append(action_item)

# # Phoenix
# for _ in range(1):
#     text = fake.sentence()
#     action_item = grequests.post(
#         'http://localhost:4000/api/items/',
#         data={"item": {"text": "some random text"}},
#         hooks={'response' : process_response})
#     async_list.append(action_item)

grequests.map(async_list)
