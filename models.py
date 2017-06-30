from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine

Base = automap_base()

# engine, suppose it has two tables 'user' and 'address' set up
engine = create_engine("postgresql://postgres@localhost:5432/cis")

# reflect the tables
Base.prepare(engine, reflect=True)

# mapped classes are now created with names by default
# matching that of the table name.
Organization_Unit = Base.classes.organization_unit
Customer = Base.classes.customer
Address = Base.classes.address
ServiceType = Base.classes.service_type
Service = Base.classes.service
CustomerAddress = Base.classes.customer_address
ServiceLocation = Base.classes.service_location

#
session = Session(engine)


# rudimentary relationships are produced
# session.add(Organization_Unit(organization_business_id=3, name="Unit 3", description="This is Org Unit 3"))
# session.add(Customer(customer_id=3, organization_business_id=3, name="Taiye", gender="female"))
# session.add(Address(address_id=3, address_line_1="13th Ave, Portsmouth", address_line_2="23th Ave, Kinshasha", zip_code=31232, billing=False))
# session.add(ServiceType(id=3, description="This is a third public service announcement"))
# session.add(Service(service_id=3, service_type_id=3, provider_id=3, description="The main service rendered part 3"))
# session.add(CustomerAddress(id=3, customer_id=3, address_id=3))
# session.add(ServiceLocation(id=3, service_id=3, address_id=3, latitude=112.721, longitude=203.201))

# session.commit()

# # collection-based relationships are by default named
# # "<classname>_collection"
# c1 = session.query(ServiceType).first()
# print(c1.description)
# # print (c1.address_collection)