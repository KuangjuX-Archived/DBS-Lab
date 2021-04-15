CREATE TABLE shippers(
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100)
);

CREATE TABLE carriers(
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50),
    point INT
);

CREATE TABLE waybill(
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50),
    goods_name VARCHAR(50),
    loading_addr VARCHAR(100),
    unloading_addr VARCHAR(100),
    freight INT,
    order_time DATE,
    shippers_id INT REFERENCES shippers(id)
);

CREATE TABLE offer(
    id SERIAL NOT NULL PRIMARY KEY,
    price INT,
    big_time DATE,
    carriers_id INT REFERENCES carriers(id),
    waybill_id INT REFERENCES waybill(id)
);

CREATE TABLE decide_offer(
    id SERIAL NOT NULL PRIMARY KEY,
    offer_id INT REFERENCES offer(id)
);

-- type 0 shippers 1 carriers
CREATE TABLE usr(
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50),
    type BOOLEAN
);