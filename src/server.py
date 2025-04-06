from flask import Flask, request 
from flask_marshmallow import Marshmallow
from flask_restful import Api, Resource 

app = Flask(__name__)
# connect to the database
app.config['DATABASE_URI'] = 'database.db'
# db = ...
ma = Marshmallow(app)
api = Api(app)



class UserSchema(ma.shcema):
    class Meta:
        fields = ("username", "password")
        #model = User

class UserResource(Resource):
    def post(self):
        ## register the user
        return ''
    

api.add_resource(UserResource, '/user')