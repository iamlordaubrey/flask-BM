CREATE TABLE organization_unit (
    organization_business_id varchar  NOT NULL,
    name  varchar NOT NULL,
    description  varchar NOT NULL,
    PRIMARY KEY (organization_business_id)
);


CREATE TABLE customer (
    customer_id varchar NOT NULL,
    organization_business_id  varchar NOT NULL,
    name  varchar NOT NULL,
    gender  varchar NOT NULL,
    PRIMARY KEY (customer_id),
    FOREIGN KEY (organization_business_id) REFERENCES organization_unit (organization_business_id)
);


CREATE TABLE address (
    address_id  varchar NOT NULL,
    address_line_1  varchar NOT NULL,
    address_line_2  varchar NOT NULL,
    zip_code  varchar NOT NULL,
    billing  boolean NOT NULL,
    PRIMARY KEY (address_id)
);

CREATE TABLE service_type (
    id  varchar NOT NULL,
    description  varchar NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE service (
    service_id  varchar NOT NULL,
    service_type_id  varchar NOT NULL,
    provider_id  varchar NOT NULL,
    description  varchar NOT NULL,
    PRIMARY KEY (service_id),
    FOREIGN KEY (service_type_id) REFERENCES service_type (id),
    FOREIGN KEY (provider_id) REFERENCES organization_unit (organization_business_id)
);


CREATE TABLE customer_address (
    id  varchar NOT NULL,
    customer_id  varchar NOT NULL,
    address_id  varchar NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    FOREIGN KEY (address_id) REFERENCES address (address_id)
);


CREATE TABLE service_location (
    id  varchar NOT NULL,
    service_id  varchar NOT NULL,
    address_id  varchar NOT NULL,
    latitude  int NOT NULL,
    longitude  int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (service_id) REFERENCES service (service_id),
    FOREIGN KEY (address_id) REFERENCES address (address_id)
);
