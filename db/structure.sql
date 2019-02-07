CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "products" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "description" text, "image_url" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "color" varchar, "price" decimal);
CREATE TABLE "orders" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "product_id" integer, "total" float);
CREATE INDEX "index_orders_on_user_id" ON "orders" ("user_id");
CREATE INDEX "index_orders_on_product_id" ON "orders" ("product_id");
CREATE TABLE "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar, "last_name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "admin" boolean DEFAULT 0 NOT NULL);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE "comments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "body" text, "rating" integer, "product_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, CONSTRAINT "fk_rails_03de2dc08c"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
, CONSTRAINT "fk_rails_a0d280f6e4"
FOREIGN KEY ("product_id")
  REFERENCES "products" ("id")
);
CREATE INDEX "index_comments_on_user_id" ON "comments" ("user_id");
CREATE INDEX "index_comments_on_product_id" ON "comments" ("product_id");
INSERT INTO "schema_migrations" (version) VALUES
('20181002001210'),
('20181029195547'),
('20181029220722'),
('20181030214101'),
('20181126171711'),
('20181126180519'),
('20181205171702'),
('20181231204216');
