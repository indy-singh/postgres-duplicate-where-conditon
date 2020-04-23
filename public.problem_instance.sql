-- Table: public.problem_instance

-- DROP TABLE public.problem_instance;

CREATE TABLE public.problem_instance
(
  id BIGSERIAL PRIMARY KEY,
  problem_id bigint NOT NULL,
  request_identifier text NOT NULL,
  assignee text,
  hostname text,
  processed boolean,
  occurrence timestamp with time zone,
  message text,
  log_count integer DEFAULT 0,
  CONSTRAINT problem_instance_problem_fkey FOREIGN KEY (problem_id)
      REFERENCES public.problem (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Index: public.problem_instance_id_idx

-- DROP INDEX public.problem_instance_id_idx;

CREATE INDEX problem_instance_id_idx
  ON public.problem_instance
  USING btree
  (id);

-- Index: public.problem_instance_occurrence_idx

-- DROP INDEX public.problem_instance_occurrence_idx;

CREATE INDEX problem_instance_occurrence_idx
  ON public.problem_instance
  USING btree
  (occurrence);

-- Index: public.problem_instance_problem_id_idx

-- DROP INDEX public.problem_instance_problem_id_idx;

CREATE INDEX problem_instance_problem_id_idx
  ON public.problem_instance
  USING btree
  (problem_id);

-- Index: public.problem_instance_problem_id_idx1

-- DROP INDEX public.problem_instance_problem_id_idx1;

CREATE INDEX problem_instance_problem_id_idx1
  ON public.problem_instance
  USING btree
  (problem_id)
  WHERE processed = false;

-- Index: public.problem_instance_problem_id_idx2

-- DROP INDEX public.problem_instance_problem_id_idx2;

CREATE INDEX problem_instance_problem_id_idx2
  ON public.problem_instance
  USING btree
  (problem_id)
  WHERE processed IS TRUE;

-- Index: public.problem_instance_problem_id_idx3

-- DROP INDEX public.problem_instance_problem_id_idx3;

CREATE INDEX problem_instance_problem_id_idx3
  ON public.problem_instance
  USING btree
  (problem_id)
  WHERE processed = true;

-- Index: public.problem_instance_problem_id_occurrence_idx

-- DROP INDEX public.problem_instance_problem_id_occurrence_idx;

CREATE INDEX problem_instance_problem_id_occurrence_idx
  ON public.problem_instance
  USING btree
  (problem_id, occurrence);

-- Index: public.problem_instance_problem_id_processed_idx

-- DROP INDEX public.problem_instance_problem_id_processed_idx;

CREATE INDEX problem_instance_problem_id_processed_idx
  ON public.problem_instance
  USING btree
  (problem_id, processed);

-- Index: public.problem_instance_request_identifier_idx

-- DROP INDEX public.problem_instance_request_identifier_idx;

CREATE INDEX problem_instance_request_identifier_idx
  ON public.problem_instance
  USING btree
  (request_identifier COLLATE pg_catalog."default");

