CREATE TABLE Consultants(
	c_id			int,
	l_name			varchar(20) NOT NULL,
	f_name			varchar(20) NOT NULL,
	labor_category	varchar(80),
	title			varchar(50),
	category		varchar(50),
	company 		varchar(255),
	email			varchar(100),
	phone_no		varchar(50),
	data_source		varchar(30),
	zipcode			varchar(10),
	address			varchar(200),
	city			varchar(50),
	state			varchar(20),
	country			char(50),
	cul_competency	varchar(6) CHECK (cul_competency IN ('High', 'Medium', 'Low')),
	if_interested	varchar(100),
	notes			text,
	PRIMARY KEY(c_id),
	UNIQUE(l_name, f_name)
);

CREATE TABLE Federal_Project(
	c_id			int,
	project			varchar(150),
	PRIMARY KEY (c_id, project),
	FOREIGN KEY (c_id) REFERENCES Consultants(c_id)
);

CREATE TABLE Target_Population(
	c_id			int,
	target_pop		varchar(100),
	PRIMARY KEY (c_id, target_pop),
	FOREIGN KEY (c_id) REFERENCES Consultants(c_id)
);

CREATE TABLE Exp_LOV(
	expertise		varchar(120),
	exp_area		varchar(100),
	PRIMARY KEY (expertise)
);

CREATE TABLE Expertise(
	c_id			int,
	expertise		varchar(70),
	yrs_of_exp		int,
	PRIMARY KEY (c_id, expertise),
	FOREIGN KEY (c_id) REFERENCES Consultants(c_id),
	FOREIGN KEY (expertise) REFERENCES Exp_LOV(expertise)
);

CREATE TABLE Education(
	c_id			int,
	degree_title	varchar(10),
	degree			varchar(150),  --degree contains study field
	grad_yr			int CHECK (grad_yr BETWEEN 1930 AND 2100),
	PRIMARY KEY (c_id, degree),
	FOREIGN KEY (c_id) REFERENCES Consultants(c_id)
);

ALTER TABLE Education
ALTER COLUMN degree TYPE varchar(150)

CREATE TABLE Certificate(
	c_id		int,
	certificate	varchar(100),
	yr			int CHECK (yr BETWEEN 1930 AND 2100),
	PRIMARY KEY (c_id, certificate),
	FOREIGN KEY (c_id) REFERENCES Consultants(c_id)
);

CREATE TABLE Cultural_Competency(
	c_id			int,
	format			varchar(13),
	LCS				varchar(50),
	PRIMARY KEY (c_id, LCS),
	FOREIGN KEY (c_id) REFERENCES Consultants(c_id)
);

CREATE TABLE Keyword(
	category		varchar(50),
	key				varchar(100),
	PRIMARY KEY (category, key)
);