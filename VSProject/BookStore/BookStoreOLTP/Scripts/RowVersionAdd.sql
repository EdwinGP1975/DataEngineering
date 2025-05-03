/****** Script para agregar el rowversion  ******/

  ALTER TABLE [address]  ADD  [rowversion] TIMESTAMP NOT NULL;
  ALTER TABLE [address_status]  ADD  [rowversion] TIMESTAMP NOT NULL;
  ALTER TABLE [author]  ADD  [rowversion] TIMESTAMP NOT NULL;
  ALTER TABLE [book]  ADD  [rowversion] TIMESTAMP NOT NULL;
  ALTER TABLE [book_author]  ADD  [rowversion] TIMESTAMP NOT NULL;
  ALTER TABLE [book_language]  ADD  [rowversion] TIMESTAMP NOT NULL;
  ALTER TABLE [cust_order]  ADD  [rowversion] TIMESTAMP NOT NULL;
  ALTER TABLE [customer]  ADD  [rowversion] TIMESTAMP NOT NULL;
  ALTER TABLE [customer_address]  ADD  [rowversion] TIMESTAMP NOT NULL;
  ALTER TABLE [order_history]  ADD  [rowversion] TIMESTAMP NOT NULL;
  ALTER TABLE [order_line]  ADD  [rowversion] TIMESTAMP NOT NULL;
  ALTER TABLE [order_status]  ADD  [rowversion] TIMESTAMP NOT NULL;
  ALTER TABLE [publisher]  ADD  [rowversion] TIMESTAMP NOT NULL;
  ALTER TABLE [shipping_method]  ADD  [rowversion] TIMESTAMP NOT NULL;
  GO
