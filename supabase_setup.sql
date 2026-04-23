-- Ejecutá esto en Supabase → SQL Editor

-- TABLA DE PROYECTOS
create table projects (
  id         uuid primary key default gen_random_uuid(),
  name       text not null,
  client     text,
  color      text default '#C8A882',
  created_at timestamptz default now()
);

-- TABLA DE ITEMS
create table items (
  id         uuid primary key default gen_random_uuid(),
  type       text not null check (type in ('image', 'link')),
  title      text not null,
  category   text not null,
  image_url  text,
  url        text,
  tags       text[] default '{}',
  note       text,
  project_id uuid references projects(id) on delete set null,
  created_at timestamptz default now()
);

-- ACCESO PÚBLICO (sin auth, cualquiera con la URL puede leer/escribir)
alter table projects enable row level security;
alter table items enable row level security;

create policy "public_all_projects" on projects for all using (true) with check (true);
create policy "public_all_items"    on items    for all using (true) with check (true);

-- REALTIME (sincronización automática entre dispositivos)
alter publication supabase_realtime add table items;
alter publication supabase_realtime add table projects;
