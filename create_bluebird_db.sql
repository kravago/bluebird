-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "users" (
    "id" int   NOT NULL,
    "name" varchar   NOT NULL,
    "email" varchar   NOT NULL,
    "password" varchar   NOT NULL,
    CONSTRAINT "pk_users" PRIMARY KEY (
        "id"
     ),
    CONSTRAINT "uc_users_email" UNIQUE (
        "email"
    )
);

CREATE TABLE "resorts" (
    "id" int   NOT NULL,
    "name" varchar   NOT NULL,
    "lat" float   NOT NULL,
    "long" float   NOT NULL,
    CONSTRAINT "pk_resorts" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "favorites" (
    "id" int   NOT NULL,
    "user_id" int   NOT NULL,
    "resort_id" int   NOT NULL,
    CONSTRAINT "pk_favorites" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "search_history" (
    "id" int   NOT NULL,
    "date" timestamp   NOT NULL,
    "user_id" int   NOT NULL,
    "resort_id" int   NOT NULL,
    CONSTRAINT "pk_search_history" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "favorites" ADD CONSTRAINT "fk_favorites_user_id" FOREIGN KEY("user_id")
REFERENCES "users" ("id");

ALTER TABLE "favorites" ADD CONSTRAINT "fk_favorites_resort_id" FOREIGN KEY("resort_id")
REFERENCES "resorts" ("id");

ALTER TABLE "search_history" ADD CONSTRAINT "fk_search_history_user_id" FOREIGN KEY("user_id")
REFERENCES "users" ("id");

ALTER TABLE "search_history" ADD CONSTRAINT "fk_search_history_resort_id" FOREIGN KEY("resort_id")
REFERENCES "resorts" ("id");

