CREATE TABLE customer (
customer_id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
national_id VARCHAR(20) UNIQUE NOT NULL,
phone_number VARCHAR(20) NOT NULL,
email VARCHAR(100) NOT NULL,
address TEXT NOT NULL,
date_of_birth DATE NOT NULL,
status VARCHAR(20),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) 



CREATE TABLE account (
account_id SERIAL PRIMARY KEY,
customer_id INT NOT NULL,
account_type VARCHAR(20),
balance DECIMAL(15,2) DEFAULT 0.00,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT fk_cutomer
	FOREIGN KEY(customer_id)
	REFERENCES customer(customer_id)
	ON DELETE RESTRICT
);




CREATE TABLE transaction_history (
transaction_id SERIAL PRIMARY KEY,
account_id INT NOT NULL,
amount DECIMAL(15,2) NOT NULL,
transaction_type VARCHAR(20),
status VARCHAR(20) DEFAULT 'COMPLETED',
transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	
	CONSTRAINT fk_account
		FOREIGN KEY(account_id)
		REFERENCES account(account_id)
		ON DELETE RESTRICT
);
	