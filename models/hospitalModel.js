const db = require('../db/connection');

const HospitalModel = {
    getAll: async (name, procedure) => {
        let query = 'SELECT * FROM hospital_procedures';
        let params = [];

        if (name || procedure) {
            query += ' WHERE';
            if (name) {
                query += ' name LIKE ?';
                params.push(`%${name}%`); // Use LIKE for partial matching
            }
            if (procedure) {
                if (name) query += ' AND'; // Add AND if both parameters are provided
                query += ' procedure LIKE ?';
                params.push(`%${procedure}%`); // Use LIKE for partial matching
            }
        }

        try {
            const [rows] = await db.query(query, params);
            return rows;
        } catch (error) {
            throw error;
        }
    },
    getById: async (id) => {
        try {
            const [rows] = await db.query('SELECT * FROM hospital_procedures WHERE id = ?', [id]);
            return rows[0]; // Return a single object instead of an array
        } catch (error) {
            throw error;
        }
    },

    create: async (data) => {
        try {
            const [result] = await db.query('INSERT INTO hospital_procedures SET ?', [data]);
            return result.insertId;
        } catch (error) {
            throw error;
        }
    },

    update: async (id, data) => {
        try {
            const [result] = await db.query('UPDATE hospital_procedures SET ? WHERE id = ?', [data, id]);
            return result.affectedRows;
        } catch (error) {
            throw error;
        }
    },

    delete: async (id) => {
        try {
            const [result] = await db.query('DELETE FROM hospital_procedures WHERE id = ?', [id]);
            return result.affectedRows;
        } catch (error) {
            throw error;
        }
    }
};

module.exports = HospitalModel;
