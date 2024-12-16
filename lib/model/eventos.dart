import 'dart:convert';

GetEvento getEventoFromJson(String str) => GetEvento.fromJson(json.decode(str));

String getEventoToJson(GetEvento data) => json.encode(data.toJson());

class GetEvento {
  String? message;
  List<Dato>? datos;

  GetEvento({
    this.message,
    this.datos,
  });

  factory GetEvento.fromJson(Map<String, dynamic> json) => GetEvento(
        message: json["message"],
        datos: json["datos"] == null
            ? []
            : List<Dato>.from(json["datos"]!.map((x) => Dato.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "datos": datos == null
            ? []
            : List<dynamic>.from(datos!.map((x) => x.toJson())),
      };
}

class Dato {
  int? id;
  String? nombre;
  String? descripcion;
  String? nombreCiudad;
  String? ubicacion;
  String? ubicacionUrl;
  int? creador;
  String? estado;
  String? nombreCategoria;
  String? imagenUrl;
  String? imagenSectores;
  dynamic extra;
  List<Dia>? dias;

  Dato({
    this.id,
    this.nombre,
    this.descripcion,
    this.nombreCiudad,
    this.ubicacion,
    this.ubicacionUrl,
    this.creador,
    this.estado,
    this.nombreCategoria,
    this.imagenUrl,
    this.imagenSectores,
    this.extra,
    this.dias,
  });

  factory Dato.fromJson(Map<String, dynamic> json) => Dato(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        nombreCiudad: json["nombre_ciudad"],
        ubicacion: json["ubicacion"],
        ubicacionUrl: json["ubicacion_url"],
        creador: json["creador"],
        estado: json["estado"],
        nombreCategoria: json["nombre_categoria"],
        imagenUrl: json["imagen_url"],
        imagenSectores: json["imagen_sectores"],
        extra: json["extra"],
        dias: json["dias"] == null
            ? []
            : List<Dia>.from(json["dias"]!.map((x) => Dia.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "nombre_ciudad": nombreCiudad,
        "ubicacion": ubicacion,
        "ubicacion_url": ubicacionUrl,
        "creador": creador,
        "estado": estado,
        "nombre_categoria": nombreCategoria,
        "imagen_url": imagenUrl,
        "imagen_sectores": imagenSectores,
        "extra": extra,
        "dias": dias == null
            ? []
            : List<dynamic>.from(dias!.map((x) => x.toJson())),
      };
}

class Dia {
  int? id;
  int? idEvento;
  DateTime? fecha;

  Dia({
    this.id,
    this.idEvento,
    this.fecha,
  });

  factory Dia.fromJson(Map<String, dynamic> json) => Dia(
        id: json["id"],
        idEvento: json["id_evento"],
        fecha: json["fecha"] == null ? null : DateTime.parse(json["fecha"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_evento": idEvento,
        "fecha":
            "${fecha!.year.toString().padLeft(4, '0')}-${fecha!.month.toString().padLeft(2, '0')}-${fecha!.day.toString().padLeft(2, '0')}",
      };
}
