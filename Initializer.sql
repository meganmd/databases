--This is initializer where create tables will go
--author = megan

--Account
DROP TABLE account CASCADE CONSTRAINTS;
CREATE TABLE account (
  username varchar(15) not null,
  password varchar(25) not null,
  phone char(10),
  email varchar(254),
  fname varchar(25),
  lname varchar(25),
  is_admin char default 0 not null check(is_admin in (0,1)),
  CONSTRAINT pk_account primary key(username)
  -- I don't believe we actually need an is_seller attribute because 
  -- an account becomes a seller when they list an item for auction
);

--Customer
--DROP TABLE customer CASCADE CONSTRAINTS;
--CREATE TABLE customer (
--  username varchar(15) not null,
--  phone char(10),
--  email varchar(254),
--  fname varchar(25),
--  lname varchar(25),
--  CONSTRAINT pk_customer primary key(username),
--  CONSTRAINT fk_customer_to_account 
--    foreign key(username) references account(username)
--    on delete cascade
--  -- more constraints:
--  -- admins cannot be customers
--  -- could have email format constraint
--  -- also could have constraint that phone be numbers
--);

--Auction
DROP TABLE auction CASCADE CONSTRAINTS;
CREATE TABLE auction (
  item_id varchar(15) not null,
  seller varchar(15) not null,
  start_time date not null,
  end_time date not null,
  starting_price number(*, 2) not null,
  item_name varchar(60) not null,
  item_description varchar(4000),
  item_category varchar(25), --should maybe have a table for these? could ask Imad
  CONSTRAINT pk_auction primary key(item_id),
  CONSTRAINT fk_auction_to_account 
    foreign key(seller) references account(username) -- where account isSeller ??
    on delete cascade
  -- more constraints:
  -- admins cannot sell stuff
  -- it would be nice if we required an entry in customer so we had an email 
  -- address and such but it isn't in the requirements
  -- starting price cannot be negative
  -- end time must be after start time / current time
);

--Bid
DROP TABLE bid CASCADE CONSTRAINTS;
CREATE TABLE bid (
  auction_id varchar(15) not null,
  customer varchar(15) not null,
  bid_time timestamp not null,
  maximum_bid_limit number(*,2) not null,
  CONSTRAINT pk_bid primary key(auction_id, customer, bid_time),
  CONSTRAINT fk_bid_to_account 
    foreign key(customer) references account(username)
    on delete cascade,
  CONSTRAINT fk_bid_to_auction 
    foreign key(auction_id) references auction(item_id)
    on delete cascade
  -- more constraints:
  -- bid must be made after auction start and before auction end
  -- seller cannot bid on own auction
  -- maximum_bid_limit must be greater than current_bid and/or starting_price
  -- customer must have entered their customer info ?
  -- can we please just require for anyone not an admin
);

--Feedback
DROP TABLE feedback CASCADE CONSTRAINTS;
CREATE TABLE feedback (
  auction varchar(15) not null,
  overall_rating char(1) not null check(overall_rating in(1, 2, 3, 4, 5)),
  quality_rating char(1) not null check(quality_rating in(1, 2, 3, 4, 5)),
  delivery_rating char(1) not null check(delivery_rating in (1, 2, 3, 4, 5)),
  comments varchar(300) not null,
  CONSTRAINT pk_feedback primary key(auction),
  CONSTRAINT fk_feedback_to_auction 
    foreign key(auction) references auction(item_id)
    on delete cascade
  -- feedback can only be entered for auctions whose status is sold (AKA past
  -- auction date and have bids)
);