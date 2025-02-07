const db = require('../db/connection');

const User = {
    create: async (userData) => {
        const { email, phone, password, age, gender, deductible, outOfPocket, healthSpending, fsaHsa } = userData;
        const query = `INSERT INTO users (email, phone, password, age, gender, deductible, outOfPocket, healthSpending, fsaHsa) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`;
        return db.execute(query, [email, phone, password, age, gender, deductible, outOfPocket, healthSpending, fsaHsa]);
    },
    findByEmail: async (email) => {
        const query = `SELECT * FROM users WHERE email = ?`;
        const [rows] = await db.execute(query, [email]);
        return rows[0];
    }
};

module.exports = User;
