import os
import shortuuid
from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_restful import Api, Resource, reqparse, fields, marshal_with, abort

from dotenv import load_dotenv, find_dotenv
load_dotenv(find_dotenv())

app = Flask(__name__)
app.config.from_object(os.environ['APP_SETTINGS'])
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

import models as model

api = Api(app)

resource_fields = {
    'organization_business_id': fields.String,
    'name': fields.String,
    'description': fields.String,
    'absolute_uri': fields.Url('org_units', absolute=True),
}


def get_org_unit(unit_id):
    unit = model.session.query(model.Organization_Unit).filter_by(organization_business_id=unit_id).first()
    if unit:
        obj = {
            'id': unit.organization_business_id,
            'name': unit.name,
            'description': unit.description
        }
        return obj

    abort(404, message="Unit ID {} doesn't exist".format(unit_id))


# List of Organization Units
class OrganizationUnitList(Resource):
    def __init__(self):
        self.reqparser = reqparse.RequestParser(bundle_errors=True)
        self.reqparser.add_argument('name', type=str, required=True,
                                    help='Organization unit requires a name')
        self.reqparser.add_argument('description', type=str, required=True,
                                    help='Organization unit requires a description')
        super(OrganizationUnitList, self).__init__()

    def get(self):
        org_units = model.session.query(model.Organization_Unit).all()
        result = []

        if org_units:
            for unit in org_units:
                obj = {
                    'id': unit.organization_business_id,
                    'name': unit.name,
                    'description': unit.description
                }

                result.append(obj)

        response = jsonify(result)
        response.status_code = 200
        return response

    @marshal_with(resource_fields)
    def post(self):
        table = model.Organization_Unit

        # sql_obj = model.session.query(table).order_by(table.organization_business_id.desc()).first()
        # next_id = sql_obj.organization_business_id + 1

        args = self.reqparser.parse_args()

        new_unit = model.Organization_Unit(
            organization_business_id=shortuuid.uuid(),
            name=args['name'],
            description=args['description']
        )

        model.session.add(new_unit)
        model.session.commit()

        return new_unit, 201


# Organization Unit
class OrganizationUnit(Resource):
    def __init__(self):
        self.reqparser = reqparse.RequestParser(bundle_errors=True)
        self.reqparser.add_argument('name', type=str, required=False,
                                    help='Organization unit requires a name')
        self.reqparser.add_argument('description', type=str, required=False,
                                    help='Organization unit requires a description')
        super(OrganizationUnit, self).__init__()

    def get(self, unit_id):
        org_unit = get_org_unit(unit_id)

        return org_unit, 200

    def put(self, unit_id):
        table = model.Organization_Unit

        args = self.reqparser.parse_args()
        for k, v in args.items():
            if v is not None:
                model.session.query(table).filter(table.organization_business_id == unit_id).update({k: v})
                model.session.commit()

        return self.get(unit_id), 200

    def delete(self, unit_id):
        table = model.Organization_Unit

        obj = model.session.query(table).filter(table.organization_business_id == unit_id)
        if obj:
            obj.delete()
        model.session.commit()

        return 204


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


api.add_resource(OrganizationUnitList, '/org_units', endpoint='org_units')
api.add_resource(OrganizationUnit, '/org_units/<string:unit_id>')
api.add_resource(ServiceTypesList, '/stl')

if __name__ == '__main__':
    app.run()