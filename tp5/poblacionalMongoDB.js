use dbClinica;

// COLECCION RECETAMEDICA
db.recetaMedica.insertMany([
    {
        idReceta: 1,
        fecha: new Date("2024-12-01"),
        descripcion: "Tratamiento inicial para ansiedad severa.",
        psiquiatra: null, // ID no disponible aún
        evolucion: null, // ID no disponible aún
        entregasMedicamento: [null, null], // IDs pendientes
        requiereMedicamentos: [
            {
                _idMedicamento: null, // ID no disponible aún
                dosis: "10 mg",
                frecuencia: "Una vez al día"
            },
            {
                _idMedicamento: null, // ID no disponible aún
                dosis: "5 mg",
                frecuencia: "Dos veces al día"
            }
        ]
    }
]);

// Obtener la receta médica
const receta = db.recetaMedica.findOne({ idReceta: 1 });

// COLECCION MEDICAMENTO
const medicamentos = [
    {
        idMedicamento: 1,
        tipo: "Ansiolítico",
        dosis: "10 mg",
        nombre: "Diazepam",
        stocks: [
            { cantidad: 50, fecha: new Date("2024-11-30") },
            { cantidad: 30, fecha: new Date("2024-12-02") }
        ],
        entregasMedicamentos: [],
        requiereDe: [receta._id] // Referencia a la receta médica
    },
    {
        idMedicamento: 2,
        tipo: "Antidepresivo",
        dosis: "5 mg",
        nombre: "Fluoxetina",
        stocks: [
            { cantidad: 100, fecha: new Date("2024-11-28") }
        ],
        entregasMedicamentos: [],
        requiereDe: [receta._id] // Referencia a la receta médica
    }
];

// Insertar medicamentos
const result = db.medicamento.insertMany(medicamentos);

// Actualizar la receta médica con los IDs de los medicamentos
db.recetaMedica.updateOne(
    { _id: receta._id },
    {
        $set: {
            "requiereMedicamentos.0._idMedicamento": result.insertedIds[0],
            "requiereMedicamentos.1._idMedicamento": result.insertedIds[1]
        }
    }
);

// COLECCION PACIENTE
db.pacientes.insertMany([
    {
        tipoDNI: "DNI",
        dni: "12345678",
        nombre: "Juan",
        apellido: "Pérez",
        obra_social: "OSDE",
        fechaNac: new Date("1985-06-15"),
        fechaIngreso: new Date("2024-11-01"),
        foto: "juan_perez.jpg",
        evoluciones: [
            {
                numeroEvolucion: 1,
                estado: "Activo",
                motivoOcultado: "Confidencial",
                fechaHora: new Date("2024-11-15T10:30:00"),
                descripcion: "El paciente muestra mejoras en el estado de ánimo.",
                diagnosticoMultiaxial: [
                    {
                        idDiagnostico: 101,
                        descripcion: "Trastorno de ansiedad generalizada",
                        nomencladores: [null, null] // IDs pendientes
                    }
                ],
                recetas: [receta._id]
            }
        ],
        turnos: [null], // ID de turno pendiente
        SOTS: [
            {
                fechaHora: new Date("2024-11-20T14:00:00"),
                observacionLlamado: "Llamado para coordinar la próxima sesión.",
                motivoLlamado: "Confirmar cita"
            }
        ],
        entregasMedicamentos: [null], // ID pendiente
        medicamentoDonados: []
    },
    {
        tipoDNI: "DNI",
        dni: "87654321",
        nombre: "Ana",
        apellido: "González",
        obra_social: "PAMI",
        fechaNac: new Date("1990-03-22"),
        fechaIngreso: new Date("2024-11-15"),
        foto: "ana_gonzalez.jpg",
        evoluciones: [],
        turnos: [],
        SOTS: [],
        entregasMedicamentos: [],
        medicamentoDonados: []
    }
]);

// COLECCION TURNO
db.turno.insertMany([
    {
        estado: "Confirmado",
        fechaHora: new Date("2024-12-10T09:00:00"),
        administrativo: null, // ID de administrativo pendiente
        profesional: null, // ID de profesional pendiente
        paciente: db.pacientes.findOne({ dni: "12345678" })._id // Referencia al paciente Juan Pérez
    },
    {
        estado: "Pendiente",
        fechaHora: new Date("2024-12-11T11:00:00"),
        administrativo: null, // ID de administrativo pendiente
        profesional: null, // ID de profesional pendiente
        paciente: db.pacientes.findOne({ dni: "87654321" })._id // Referencia al paciente Ana González
    }
]);
