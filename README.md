# Mis finanzas

App personal para saber cuánto puedo gastar lo que queda del mes en cada categoría, anotar gastos rápido y ver mis ahorros.

- Se abre en el navegador y se instala en el iPhone desde Safari: **Compartir → Agregar a inicio**.
- Los datos viven en Supabase (mismo proyecto del gimnasio, tabla aparte `fin_docs`), protegidos con inicio de sesión. Este repositorio solo tiene el diseño de la app, ningún dato.
- `supabase/schema.sql` crea la tabla y sus reglas de acceso.
- Las cuentas finales salen de los estados de cuenta: lo anotado en la app sirve de control mientras llega el estado.

## Atajos de Apple

La app acepta datos en la dirección para abrir el formulario ya lleno:

- Anotar: `…/mis-finanzas/?anotar=1&monto=150&cat=Comida&tarjeta=Debito&nota=Baleadas`
- ¿Lo compro?: `…/mis-finanzas/?compro=1&monto=800&cat=Ropa`

`cat` y `tarjeta` aceptan el inicio del nombre, sin tildes. `moneda=USD` para dólares.
