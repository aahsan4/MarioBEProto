const HospitalModel = require('../models/hospitalModel');

exports.getAllHospitals = async (req, res) => {
    try {
        const { name, procedure } = req.query; // Extract search parameters from query string
        const hospitals = await HospitalModel.getAll(name, procedure); // Pass them to the model
        res.json(hospitals);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.getHospitalById = async (req, res) => {
    try {
        const hospital = await HospitalModel.getById(req.params.id);
        if (!hospital) return res.status(404).json({ message: 'Hospital not found' });
        res.json(hospital);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.createHospital = async (req, res) => {
    try {
        const id = await HospitalModel.create(req.body);
        res.status(201).json({ message: 'Hospital added successfully', id });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.updateHospital = async (req, res) => {
    try {
        const updatedRows = await HospitalModel.update(req.params.id, req.body);
        if (updatedRows === 0) return res.status(404).json({ message: 'Hospital not found' });
        res.json({ message: 'Hospital updated successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.deleteHospital = async (req, res) => {
    try {
        const deletedRows = await HospitalModel.delete(req.params.id);
        if (deletedRows === 0) return res.status(404).json({ message: 'Hospital not found' });
        res.json({ message: 'Hospital deleted successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
