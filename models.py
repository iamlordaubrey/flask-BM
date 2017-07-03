# Making use of sqlalchemy automap
import os

from sqlalchemy.ext.automap import automap_base, generate_relationship


def _gen_relationship(base, direction, return_fn, attrname, local_cls, referred_cls, **kw):
    if direction is interfaces.ONETOMANY:
        kw['cascade'] = 'all, delete-orphan'
        kw['passive_deletes'] = True

    return generate_relationship(base, direction, return_fn, attrname, local_cls, referred_cls, **kw)


from sqlalchemy.orm import Session, interfaces
from sqlalchemy import create_engine

Base = automap_base()

engine = create_engine(os.environ['DATABASE_URL'])

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
