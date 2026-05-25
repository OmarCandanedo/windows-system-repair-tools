# Windows System Repair Tools 🛠️

Una colección de herramientas avanzadas para reparar y optimizar Windows, desarrolladas por **OmarCandanedo**.

## 📋 Herramientas Disponibles

### 1. **EXPLORER_NUCLEAR_REPAIR_v3.1.bat** ⚡
Reparación nuclear completa de Explorer.exe y PowerShell con 4 modos de operación.

#### Características:
- ✅ **Reparación Explorer** (12 fases completas)
  - Limpieza atómica de cachés corruptos
  - Reparación segura de WMI (sin hangs)
  - Re-registro de DLLs críticas
  - Optimización de rendimiento
  
- ✅ **Full Reset PowerShell** (7 fases)
  - Eliminación de módulos corruptos
  - Reset completo de políticas
  - Reinstalación limpia

- ✅ **Reparación Completa** (Ambos procesos)
  - Ejecuta Explorer + PowerShell en secuencia

- ✅ **Diagnóstico** (Sin hangs)
  - Verifica IconCache
  - Valida WMI
  - Prueba servicios críticos
  - Verifica integridad de archivos

---

## 🚀 Requisitos

- **Windows 10/11**
- **Acceso de Administrador** (OBLIGATORIO)
- **Conexión a Internet** (opcional, para algunos módulos)

---

## 📥 Instalación

1. Descarga `EXPLORER_NUCLEAR_REPAIR_v3.1.bat`
2. **Clic derecho → Ejecutar como administrador**
3. Selecciona una opción del menú

---

## 📖 Guía de Uso

### Opción 1: Reparación Explorer
```
Recomendado para:
- Explorer congelado o lento
- Miniaturas no visibles
- Búsqueda de Windows rota
- Freezes constantes
```

### Opción 2: Full Reset PowerShell
```
Recomendado para:
- PowerShell no responde
- Scripts que no se ejecutan
- Módulos corruptos
- Errores de ejecución
```

### Opción 3: Ambos (Reparación Total)
```
Recomendado para:
- Problemas generales del sistema
- Múltiples fallos detectados
- Optimización general
```

### Opción 4: Diagnóstico
```
Recomendado para:
- Identificar problemas específicos
- Generar reporte de estado
- Antes de reparación nuclear
```

---

## ⚠️ Advertencias Importantes

- **HACER BACKUP** antes de ejecutar
- **REQUIERE ADMIN** - El script se cerrará si no tienes permisos
- **PUEDE TARDAR** - Algunas fases pueden tomar 5-10 minutos
- **REINICIO RECOMENDADO** - Después de completar la reparación

---

## 📊 Fases de Reparación Explorer

| Fase | Tarea |
|------|-------|
| 1/12 | Crear punto de restauración |
| 2/12 | Terminar procesos conflictivos |
| 3/12 | Limpiar caches corruptos |
| 4/12 | Reparar WMI (método seguro) |
| 5/12 | Deshabilitar extensiones shell problemáticas |
| 6/12 | Re-registrar DLLs críticas |
| 7/12 | Reparar índices de búsqueda |
| 8/12 | Reset configuración Explorer |
| 9/12 | Limpiar Prefetch/Superfetch |
| 10/12 | Optimizar registro |
| 11/12 | Ejecutar DISM + SFC |
| 12/12 | Reiniciar Explorer |

---

## 📊 Fases de Full Reset PowerShell

| Fase | Tarea |
|------|-------|
| 1/7 | Terminar procesos PowerShell |
| 2/7 | Eliminar módulos corruptos |
| 3/7 | Limpiar cache y configuración |
| 4/7 | Reset políticas de ejecución |
| 5/7 | Re-registrar componentes |
| 6/7 | Reinstalar módulos base |
| 7/7 | Actualizar ayuda |

---

## 🔧 Troubleshooting

### El script se cierra sin hacer nada
```
→ Debes ejecutar como ADMINISTRADOR
→ Clic derecho en el .bat → Ejecutar como administrador
```

### El proceso se congela en la Fase 4 (WMI)
```
→ El script tiene timeout de 5 segundos
→ Si persiste, cancela y usa Opción 4 (Diagnóstico) primero
```

### PowerShell sigue sin funcionar
```
→ Reinicia Windows después de la reparación
→ Si persiste, considera reinstalar PowerShell 7
```

---

## 📝 Logs y Reportes

Los logs se generan automáticamente en:
```
C:\Windows\Temp\
```

---

## 🤝 Contribuciones

Reporta bugs o sugiere mejoras en:
- **GitHub Issues**
- **Discussions**

---

## 📄 Licencia

Este proyecto está bajo licencia **MIT**

---

## 👤 Autor

**OmarCandanedo**
- GitHub: [@OmarCandanedo](https://github.com/OmarCandanedo)
- Repositorio: [windows-system-repair-tools](https://github.com/OmarCandanedo/windows-system-repair-tools)

---

## ⭐ Soporte

Si te fue útil, considera dejar una ⭐ en el repositorio.

---

**Última actualización:** Mayo 2025  
**Versión:** 3.1 (FIXED)
