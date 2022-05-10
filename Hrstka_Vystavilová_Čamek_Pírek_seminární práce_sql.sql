
CREATE TABLE public.person (
	first_name varchar(50),
	last_name varchar(50),
	middle_name varchar(40),
	gender char(1),
	age smallint,
	marital_status varchar(10),
	personal_identification_number varchar(11) NOT NULL,
	person_state varchar(15),
	sex smallint,
	nationality smallint,
	marital_status1 smallint,
	CONSTRAINT personal_identification_number_pk PRIMARY KEY (personal_identification_number));


CREATE TABLE public.facility (
	facility_name varchar(50),
	person_identification_number integer NOT NULL,
	tax_identification_number varchar(25),
	legal_establishment varchar(25),
	type_of_facility char(1),
	responsible_person varchar(50),
	phone_number varchar(15),
	id_address integer,
	personal_identification_number varchar(11),
	nationality smallint,
	CONSTRAINT person_identification_number_pk PRIMARY KEY (person_identification_number));


CREATE TABLE public.address (
	id_address serial NOT NULL,
	street varchar(35),
	street_number varchar(15),
	orientation_number varchar(15),
	town varchar(35),
	district varchar(15),
	postal_code integer,
	CONSTRAINT id_address_pk PRIMARY KEY (id_address));

CREATE TABLE public.court (
	court_name varchar(50),
	identification_number integer NOT NULL,
	tax_identification_number varchar(25),
	legal_establishment varchar(25),
	responsible_person varchar(50),
	phone_number varchar(15),
	nationality smallint,
	id_address integer,
	CONSTRAINT identification_number_pk PRIMARY KEY (identification_number));

CREATE TABLE public.ci_address_type (
	identification_number serial,
	code smallint NOT NULL,
	value varchar(50),
	small_description varchar(100),
	large_description text,
	CONSTRAINT code_pk PRIMARY KEY (code));

CREATE TABLE public.person_to_address (
	id_address integer,
	code smallint,
	personal_identification_number varchar(11));

CREATE TABLE public.ci_sex (
	identification_number serial,
	code smallint NOT NULL,
	value varchar(50),
	small_description varchar(100),
	large_description text,
	CONSTRAINT code_pk PRIMARY KEY (code));


CREATE TABLE public.ci_marital_status (
	identification_number serial,
	code smallint NOT NULL,
	value varchar(50),
	small_description varchar(100),
	large_description text,
	CONSTRAINT code_pk PRIMARY KEY (code));


CREATE TABLE public.ci_nationality (
	identification_number serial,
	code smallint NOT NULL,
	value varchar(50),
	small_description varchar(100),
	large_description text,
	CONSTRAINT code_pk PRIMARY KEY (code));

ALTER TABLE public.person_to_address DROP CONSTRAINT IF EXISTS address_fk CASCADE;
ALTER TABLE public.person_to_address ADD CONSTRAINT address_fk FOREIGN KEY (id_address)
REFERENCES public.address (id_address) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE public.person_to_address DROP CONSTRAINT IF EXISTS ci_address_type_fk CASCADE;
ALTER TABLE public.person_to_address ADD CONSTRAINT ci_address_type_fk FOREIGN KEY (code)
REFERENCES public.ci_address_type (code) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE public.person_to_address DROP CONSTRAINT IF EXISTS person_fk CASCADE;
ALTER TABLE public.person_to_address ADD CONSTRAINT person_fk FOREIGN KEY (personal_identification_number)
REFERENCES public.person (personal_identification_number) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE public.facility DROP CONSTRAINT IF EXISTS address_fk CASCADE;
ALTER TABLE public.facility ADD CONSTRAINT address_fk FOREIGN KEY (id_address)
REFERENCES public.address (id_address) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE public.facility DROP CONSTRAINT IF EXISTS person_fk CASCADE;
ALTER TABLE public.facility ADD CONSTRAINT person_fk FOREIGN KEY (personal_identification_number)
REFERENCES public.person (personal_identification_number) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE public.person DROP CONSTRAINT IF EXISTS ci_sex_fk CASCADE;
ALTER TABLE public.person ADD CONSTRAINT ci_sex_fk FOREIGN KEY (sex)
REFERENCES public.ci_sex (code) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE public.person DROP CONSTRAINT IF EXISTS ci_marital_status_fk CASCADE;
ALTER TABLE public.person ADD CONSTRAINT ci_marital_status_fk FOREIGN KEY (marital_status1)
REFERENCES public.ci_marital_status (code) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE public.person DROP CONSTRAINT IF EXISTS ci_nationality_fk CASCADE;
ALTER TABLE public.person ADD CONSTRAINT ci_nationality_fk FOREIGN KEY (nationality)
REFERENCES public.ci_nationality (code) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE public.facility DROP CONSTRAINT IF EXISTS ci_nationality_fk CASCADE;
ALTER TABLE public.facility ADD CONSTRAINT ci_nationality_fk FOREIGN KEY (nationality)
REFERENCES public.ci_nationality (code) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE public.court DROP CONSTRAINT IF EXISTS ci_nationality_fk CASCADE;
ALTER TABLE public.court ADD CONSTRAINT ci_nationality_fk FOREIGN KEY (nationality)
REFERENCES public.ci_nationality (code) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE public.court DROP CONSTRAINT IF EXISTS address_fk CASCADE;
ALTER TABLE public.court ADD CONSTRAINT address_fk FOREIGN KEY (id_address)
REFERENCES public.address (id_address) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;



