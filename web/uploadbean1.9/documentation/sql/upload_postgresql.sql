CREATE TABLE "public"."uploads" (
"filename" VARCHAR(255),
uploadid SERIAL,
"binaryfile" BYTEA,
UNIQUE("uploadid")
) WITH OIDS;
