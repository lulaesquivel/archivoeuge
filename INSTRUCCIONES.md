# Archivo — Instrucciones de deploy

## 1. Crear proyecto en Supabase (5 min)

1. Ir a https://supabase.com → crear cuenta gratis
2. New Project → ponerle nombre "archivo", elegir región más cercana (ej. São Paulo)
3. Esperar que termine de crearse (~2 min)
4. Ir a **SQL Editor** → pegar el contenido de `supabase_setup.sql` → Run
5. Ir a **Storage** → New bucket → nombre: `archivo-images` → marcar como **Public** → Create
6. Ir a **Project Settings → API** → copiar:
   - `Project URL` → reemplazá `TU_SUPABASE_URL` en index.html
   - `anon public key` → reemplazá `TU_SUPABASE_ANON_KEY` en index.html

## 2. Deploy en Vercel (3 min)

1. Subir la carpeta `archivo/` a un repo de GitHub (puede ser privado)
2. Ir a https://vercel.com → importar el repo
3. Deploy → Vercel te da una URL tipo `archivo-xyz.vercel.app`
4. Esa URL es la app — funciona en celu y compu, siempre sincronizada

## 3. Instalar en iPhone

1. Abrir la URL en Safari
2. Botón compartir → "Agregar a pantalla de inicio"
3. Listo — queda el ícono como una app

## Cómo funciona la sincronización

- Cada vez que guardás algo, va directo a Supabase
- Supabase manda una notificación en tiempo real a todos los dispositivos conectados
- La app se actualiza sola — sin recargar la página

## Tier gratuito de Supabase incluye

- 500 MB de base de datos
- 1 GB de storage para imágenes
- 50,000 requests por mes
- Más que suficiente para uso personal
