import os
from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_restful import Api, Resource

from dotenv import load_dotenv, find_dotenv
load_dotenv(find_dotenv())

app = Flask(__name__)
app.config.from_object(os.environ['APP_SETTINGS'])
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

import models as model

api = Api(app)


# Service Types
class ServiceTypesList(Resource):
    def get(self):
        service_types_list = model.session.query(model.ServiceType).all()

        result = []
        for service_type in service_types_list:
            obj = {
                'id': service_type.id,
                'description': service_type.description
            }

            result.append(obj)

        response = jsonify(result)
        response.status_code = 200
        return response


api.add_resource(ServiceTypesList, '/stl')

if __name__ == '__main__':
    app.run()