CREATE TABLE public.accounts (
    account_id  NOT NULL,
    billing_cycle_id  NOT NULL,
    billing_period_id  NOT NULL,
    billing_frequency_id  NOT NULL,
    account_type_id  NOT NULL,
    currency_id  NOT NULL,
    account_status_id  NOT NULL,
    account_status_reason_id  NOT NULL,
    account_creator  NOT NULL,
    record_creation_date  NOT NULL,
    billing_status_id  NOT NULL,
    billing_status_reason_id  NOT NULL,
    account_charge_type_id  NOT NULL,
    system_origination ,
    account_desc ,
    termination_date ,
    external_account_number ,
    external_customer_number ,
    PRIMARY KEY (account_id)
);


CREATE TABLE public.org_types (
    org_type_id  NOT NULL,
    org_type_name  NOT NULL,
    org_type_desc ,
    PRIMARY KEY (org_type_id)
);


CREATE TABLE public.organization_units (
    org_bu_id  NOT NULL,
    org_entity_id  NOT NULL,
    address_premise_id  NOT NULL,
    org_name  NOT NULL,
    org_desc ,
    bankruptcy_start_date ,
    bankruptcy_end_date ,
    termination_date ,
    time_zone  NOT NULL,
    vat_inclusion ,
    vat_region ,
    fathom_cis_client_id  NOT NULL,
    effective_from_date  NOT NULL,
    effective_to_date ,
    PRIMARY KEY (org_bu_id)
);


CREATE TABLE public.entity1 (
);


CREATE TABLE public.entity2 (
);


CREATE TABLE public.entity3 (
);


CREATE TABLE public.entity4 (
);


CREATE TABLE public.entity5 (
);


CREATE TABLE public.entity6 (
);


CREATE TABLE public.organization_entities (
    org_entity_id  NOT NULL,
    org_entity_name  NOT NULL,
    org_entity_desc ,
    business_title  NOT NULL,
    year_established ,
    effective_from_date  NOT NULL,
    effective_to_date ,
    address_location_id  NOT NULL,
    org_type_id  NOT NULL,
    PRIMARY KEY (org_entity_id)
);


CREATE TABLE public.premises (
    premise_id  NOT NULL,
    premise_type_id  NOT NULL,
    premise_name  NOT NULL,
    premise_desc ,
    PRIMARY KEY (premise_id)
);


CREATE TABLE public.address_premises (
    address_premise_id  NOT NULL,
    address_name  NOT NULL,
    address_desc ,
    address_line_1 ,
    address_line_2 ,
    address_line_3 ,
    address_line_4 ,
    address_style_id  NOT NULL,
    address_type_id  NOT NULL,
    latitude ,
    longitude ,
    post_office_box ,
    street_number ,
    street_num_suffix_id ,
    street_prefix_id ,
    street ,
    street_suffix_id ,
    suite_room ,
    building_desc ,
    city ,
    state_code ,
    postal_code ,
    postal_plus_code ,
    country_code ,
    record_creation_date  NOT NULL,
    last_update_date  NOT NULL,
    address_premise_id  NOT NULL,
    PRIMARY KEY (address_premise_id)
);


CREATE TABLE public.premise_types (
);


CREATE TABLE public.fathom_cis_clients (
);


CREATE TABLE public.fathom_client_types (
    fathom_client_type_id  NOT NULL,
    fathom_client_type  NOT NULL,
    fathom_client_type_desc ,
    PRIMARY KEY (fathom_client_type_id)
);


CREATE TABLE public.address_styles (
);


CREATE TABLE public.entity7 (
);


CREATE TABLE public.contacts (
    contact_id  NOT NULL,
    name_prefix ,
    name_suffix ,
    first_name  NOT NULL,
    middle_name ,
    last_name  NOT NULL,
    email ,
    primary_phone ,
    secondary_phone ,
    cell_phone ,
    PRIMARY KEY (contact_id)
);


CREATE TABLE public.contact_types (
    contact_type_id  NOT NULL,
    contact_type  NOT NULL,
    contact_type_desc ,
    PRIMARY KEY (contact_type_id)
);


CREATE TABLE public.customers (
    customer_id  NOT NULL,
    billing_address_id  NOT NULL,
    billing_address_effective_date  NOT NULL,
    workplace ,
    job_position ,
    legal_title_to_housing ,
    number_of_residents ,
    dwelling_tenure ,
    dwelling_size ,
    source_of_income ,
    living_at_current_address_since ,
    prev_employment_start_date ,
    prev_employment_end_date ,
    final_settlement_start_date ,
    final_settlement_end_date ,
    termination_date ,
    liquidation_start_date ,
    liquidation_end_date ,
    payment_account_open_date ,
    payment_account_close_date ,
    record_creation_date  NOT NULL,
    last_update_date  NOT NULL,
    customer_payment_responsible_id  NOT NULL,
    date_of_birth ,
    date_of_death ,
    vip_status ,
    vip_desc ,
    special_needs_status ,
    special_needs_desc ,
    primary_language ,
    PRIMARY KEY (customer_id)
);


CREATE TABLE public.customer_accounts (
    customer_account_id  NOT NULL,
    PRIMARY KEY (customer_account_id)
);


CREATE TABLE public.party_accounts (
);


CREATE TABLE public.address_types (
);


CREATE TABLE public.states (
);


CREATE TABLE public.countries (
);


CREATE TABLE public.customer_restricted_info (
    customer_restricted_info_id  NOT NULL,
    contact_id  NOT NULL,
    mother_first_name ,
    mother_last_name ,
    marital_status ,
    date_of_birth ,
    date_of_death ,
    drivers_license_number ,
    drivers_license_state ,
    ssn ,
    passport_number ,
    passport_exp_date ,
    federal_id ,
    place_of_birth ,
    PRIMARY KEY (customer_restricted_info_id)
);


CREATE TABLE public.ou_ (
);


CREATE TABLE public.ou_customers (
);


CREATE TABLE public.org_contacts (
    org_contact_id  NOT NULL,
    org_bu_id  NOT NULL,
    contact_id  NOT NULL,
    PRIMARY KEY (org_contact_id)
);


CREATE TABLE public.contact_relationships (
    contact_relationship_id  NOT NULL,
    customer_id  NOT NULL,
    address_premise_id ,
    contact_id  NOT NULL,
    contact_type_id  NOT NULL,
    account_id  NOT NULL,
    org_bu_id ,
    effective_from_date  NOT NULL,
    effective_to_date ,
    record_creation_date  NOT NULL,
    PRIMARY KEY (contact_relationship_id)
);


CREATE TABLE public.contacts_addresses (
    contact_address_id  NOT NULL,
    address_premise_id  NOT NULL,
    contact_id  NOT NULL,
    effective_from_date  NOT NULL,
    effective_to_date ,
    PRIMARY KEY (contact_address_id)
);


CREATE TABLE public.billing_cycles (
);


CREATE TABLE public.billing_periods (
);


CREATE TABLE public.billing_frequencies (
);


CREATE TABLE public.account_types (
);


CREATE TABLE public.account_statuses (
);


CREATE TABLE public.account_status_reasons (
);


CREATE TABLE public.billing_statuses (
);


CREATE TABLE public.billing_status_reasons (
);


CREATE TABLE public.account_charge_types (
);


CREATE TABLE public.service_locations (
    service_location_id  NOT NULL,
    service_type_id  NOT NULL,
    cycle  NOT NULL,
    route  NOT NULL,
    external_service_id  NOT NULL,
    service_status_id  NOT NULL,
    location_desc ,
    latitude ,
    longitude ,
    series_group ,
    series_group_sequence ,
    service_classification  NOT NULL,
    PRIMARY KEY (service_location_id)
);


CREATE TABLE public.service_types (
);


CREATE TABLE public.service_statuses (
);


CREATE TABLE public.service_relationships (
    service_relationship_id  NOT NULL,
    service_location_id  NOT NULL,
    account_id  NOT NULL,
    address_premise_id  NOT NULL,
    account_effective_from_date  NOT NULL,
    account_effective_to_date ,
    add_prem_effective_from_date  NOT NULL,
    add_prem_effective_to_date  NOT NULL,
    PRIMARY KEY (service_relationship_id)
);


CREATE TABLE public.entity8 (
);


CREATE TABLE public.street_suffix (
);


CREATE TABLE public.street_prefix (
);


CREATE TABLE public.street_num_suffix (
);


CREATE TABLE public.tax_district (
);


CREATE TABLE public.board_ (
);


CREATE TABLE public.service (
);


CREATE TABLE public.service (
    service_id  NOT NULL,
    service_type_id  NOT NULL,
    provider_id  NOT NULL
);


CREATE TABLE public.entity9 (
);

