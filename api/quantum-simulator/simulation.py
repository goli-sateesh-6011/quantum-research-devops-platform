from qiskit import QuantumCircuit, Aer, execute

qc = QuantumCircuit(2)
qc.h(0)
qc.cx(0,1)

simulator = Aer.get_backend('qasm_simulator')
result = execute(qc, simulator, shots=1000.result())

counts = result.get_counts()

print("Simulation result:")
print(counts)

