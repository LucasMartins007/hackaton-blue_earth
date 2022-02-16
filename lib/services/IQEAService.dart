class IQEAService {
  calcularNota(String expessura, int resultado) {
    print(resultado.toString());
    print(expessura.toString());
    return (double.parse(expessura.toString()) * resultado) /
        double.parse(expessura.toString());
  }
}
