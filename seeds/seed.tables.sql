BEGIN;

TRUNCATE
  "word",
  "language",
  "user";

INSERT INTO "user" ("id", "username", "name", "password")
VALUES
  (
    1,
    'admin',
    'John Wellbrock Admin',
    -- password = "pass"
    '$2a$10$fCWkaGbt7ZErxaxclioLteLUgg4Q3Rp09WW0s/wSLxDKYsaGYUpjG'
  );

INSERT INTO "language" ("id", "name", "user_id")
VALUES
  (1, 'Latin', 1);

INSERT INTO "word" ("id", "language_id", "original", "translation", "next")
VALUES
  (1, 1, 'ad infinitum', 'to infinity', 2),
  (2, 1, 'antebellum', 'before the war', 3),
  (3, 1, 'aurora borealis', 'northern lights', 4),
  (4, 1, 'cum laude', 'with honor', 5),
  (5, 1, 'curriculum vitae', 'course of life', 6),
  (6, 1, 'deus ex machina', 'God from the machine', 7),
  (7, 1, 'emeritus', 'having served your time', 8),
  (8, 1, 'ex nihilo', 'out of nothing', 9),
  (9, 1, 'magnum opus', 'great work', 10),
  (10, 1, 'in vitro', 'in glass', null);

UPDATE "language" SET head = 1 WHERE id = 1;

-- because we explicitly set the id fields
-- update the sequencer for future automatic id setting
SELECT setval('word_id_seq', (SELECT MAX(id) from "word"));
SELECT setval('language_id_seq', (SELECT MAX(id) from "language"));
SELECT setval('user_id_seq', (SELECT MAX(id) from "user"));

COMMIT;
