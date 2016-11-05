--This is initializer where create tables will go

--Account
DROP TABLE account CASCADE CONSTRAINTS;
CREATE TABLE account (
  username varchar(15) not null,
  password varchar(15) not null,
  isAdmin char not null check(isAdmin in (0,1)),
  isSeller char not null check(isSeller in (0,1)),
  primary key(username)
);

--Customer
DROP TABLE customer CASCADE CONSTRAINTS;
CREATE TABLE customer (
  username varchar(15) not null,
  phone varchar(10),
  email varchar(254),
  fName varchar(25),
  lName varchar(25),
  primary key(username),
  CONSTRAINT FK_username foreign key(username) references account(username)
);

--Auction
DROP TABLE auction CASCADE CONSTRAINTS;
CREATE TABLE auction (
  itemId varchar(15) not null,
  seller varchar(15) not null,
  startTime date not null,
  endTime date not null,
  startingPrice number(*, 2) not null,
  itemName varchar(25) not null,
  itemDescription varchar(300),
  itemCategory varchar(25), --should maybe have a table for these? could ask Imad
  primary key(itemId),
  CONSTRAINT FK_sellerUsername foreign key(seller) references account(username) -- where account isSeller ??
);

--Bid
DROP TABLE bid CASCADE CONSTRAINTS;
CREATE TABLE bid (
  auctionId varchar(15) not null,
  customer varchar(15) not null,
  time timestamp not null,
  maximumBidLimit number(*,2) not null,
  primary key(auctionId),
  CONSTRAINT FK_customerUsername foreign key(customer) references account(username),
  CONSTRAINT FK_bidToAuctionId foreign key(auctionId) references auction(itemId)
);

--Feedback
DROP TABLE feedback CASCADE CONSTRAINTS;
CREATE TABLE feedback (
  auction varchar(15) not null,
  overallRating char(1) not null check(overallRating in(1, 2, 3, 4, 5)),
  qualityRating char(1) not null check(qualityRating in(1, 2, 3, 4, 5)),
  deliveryRating char(1) not null check(deliveryRating in (1, 2, 3, 4, 5)),
  comments varchar(300) not null,
  primary key(auction),
  CONSTRAINT FK_feedbackToAuctionId foreign key(auction) references auction(itemId)
);