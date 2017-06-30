# Making use of sqlalchemy automap

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


session = Session(engine)
