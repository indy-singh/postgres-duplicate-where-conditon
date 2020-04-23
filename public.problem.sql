-- Table: public.problem

-- DROP TABLE public.problem;

CREATE TABLE public.problem
(
  id BIGSERIAL PRIMARY KEY,
  name text NOT NULL,
  environment_id integer NOT NULL,
  key text,
  first_occurrence timestamp with time zone,
  last_occurrence timestamp with time zone,
  assignee text,
  status integer,
  reason text,
  project_id integer,
  classified_by text,
  classified_at timestamp with time zone
);

-- Index: public.problem_environment_id_id_idx

-- DROP INDEX public.problem_environment_id_id_idx;

CREATE INDEX problem_environment_id_id_idx
  ON public.problem
  USING btree
  (environment_id, id);

-- Index: public.problem_environment_id_idx

-- DROP INDEX public.problem_environment_id_idx;

CREATE INDEX problem_environment_id_idx
  ON public.problem
  USING btree
  (environment_id)
  WHERE status <> 2;

-- Index: public.problem_environment_id_status_idx

-- DROP INDEX public.problem_environment_id_status_idx;

CREATE INDEX problem_environment_id_status_idx
  ON public.problem
  USING btree
  (environment_id, status);

-- Index: public.problem_id_idx

-- DROP INDEX public.problem_id_idx;

CREATE INDEX problem_id_idx
  ON public.problem
  USING btree
  (id);

-- Index: public.problem_id_idx1

-- DROP INDEX public.problem_id_idx1;

CREATE INDEX problem_id_idx1
  ON public.problem
  USING btree
  (id)
  WHERE status <> 2;

-- Index: public.problem_name_environment_id_idx

-- DROP INDEX public.problem_name_environment_id_idx;

CREATE UNIQUE INDEX problem_name_environment_id_idx
  ON public.problem
  USING btree
  (name COLLATE pg_catalog."default", environment_id)
  WHERE status <> 2;

