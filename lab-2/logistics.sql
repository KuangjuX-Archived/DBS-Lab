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
    bid_time DATE,
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

-- insert some data into table
-- shippers
INSERT INTO shippers(id, name, address)
VALUES(1, '1', '1');

INSERT INTO shippers(id, name, address)
VALUES(2, '1', '1');

INSERT INTO shippers(id, name, address)
VALUES(3, '3', '3');

INSERT INTO shippers(id, name, address)
VALUES(4, '4', '4');

INSERT INTO shippers(id, name, address)
VALUES(5, '5', '5');


-- carriers
INSERT INTO carriers(id, name, point)
VALUES(1, '1', 100);

INSERT INTO carriers(id, name, point)
VALUES(2, '2', 90);

INSERT INTO carriers(id, name, point)
VALUES(3, '3', 80);

INSERT INTO carriers(id, name, point)
VALUES(1, '4', 70);

INSERT INTO carriers(id, name, point)
VALUES(1, '5', 60);


-- waybill
INSERT INTO waybill(id, name, goods_name, loading_addr, unloading_addr, freight, order_time, shippers_id)
VALUES(1, '1', '1', '1', '1', 1000, '2021-4-15', 1);

INSERT INTO waybill(id, name, goods_name, loading_addr, unloading_addr, freight, order_time, shippers_id)
VALUES(2, '2', '2', '2', '2', 1000, '2021-4-15', 2);

INSERT INTO waybill(id, name, goods_name, loading_addr, unloading_addr, freight, order_time, shippers_id)
VALUES(3, '3', '3', '3', '3', 1000, '2021-4-15', 3);

INSERT INTO waybill(id, name, goods_name, loading_addr, unloading_addr, freight, order_time, shippers_id)
VALUES(4, '1', '1', '1', '1', 1000, '2021-4-15', 4);

INSERT INTO waybill(id, name, goods_name, loading_addr, unloading_addr, freight, order_time, shippers_id)
VALUES(5, '1', '1', '1', '1', 1000, '2021-4-15', 5);

-- offer
INSERT INTO offer(id, price, big_time, carriers_id, waybill_id)
VALUES(1, 150, '2021-4-15', 1, 1);

INSERT INTO offer(id, price, big_time, carriers_id, waybill_id)
VALUES(2, 150, '2021-4-15', 2, 2);

INSERT INTO offer(id, price, big_time, carriers_id, waybill_id)
VALUES(3, 150, '2021-4-15', 3, 3);

INSERT INTO offer(id, price, big_time, carriers_id, waybill_id)
VALUES(4, 150, '2021-4-15', 4, 4);

INSERT INTO offer(id, price, big_time, carriers_id, waybill_id)
VALUES(5, 150, '2021-4-15', 5, 5);

-- decide_offer
INSERT INTO decide_offer(id, offer_id)
VALUES(1, 1);

INSERT INTO decide_offer(id, offer_id)
VALUES(2, 2);

INSERT INTO decide_offer(id, offer_id)
VALUES(3, 3);

INSERT INTO decide_offer(id, offer_id)
VALUES(4, 4);

INSERT INTO decide_offer(id, offer_id)
VALUES(5, 5);

-- usr
INSERT INTO usr(id, name, type)
VALUES(1, '1', '0');

INSERT INTO usr(id, name, type)
VALUES(2, '2', '0');

INSERT INTO usr(id, name, type)
VALUES(3, '3', '0');

INSERT INTO usr(id, name, type)
VALUES(4, '4', '0');

INSERT INTO usr(id, name, type)
VALUES(5, '5', '0');

INSERT INTO usr(id, name, type)
VALUES(6, '1', '1');

INSERT INTO usr(id, name, type)
VALUES(7, '2', '1');

INSERT INTO usr(id, name, type)
VALUES(8, '3', '1');

INSERT INTO usr(id, name, type)
VALUES(9, '4', '1');

INSERT INTO usr(id, name, type)
VALUES(10, '5', '1');