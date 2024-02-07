


import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:panda/src/annotations/panda_annotation.dart';
import 'package:source_gen/source_gen.dart';

class HashCodeGenerator extends GeneratorForAnnotation<HashCode> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final List<DartObject>? fieldsToExclude =
        annotation.objectValue.getField('exclude')?.toListValue();

    final StringBuffer buffer = StringBuffer();
    final HashCodeVisitor visitor = HashCodeVisitor(fieldsToExclude);
    element.visitChildren(visitor);

    bool hasSuperAnnotation = false;
    for (final ElementAnnotation meta in element.metadata) {
      if (meta.computeConstantValue()?.type?.toString() == 'Super') {
        hasSuperAnnotation = true;
      }
    }

    String targetName = visitor.className.toString();
    if (hasSuperAnnotation) {
      targetName = '_${visitor.className}';
    }

    buffer.writeln(
      'extension _\$${visitor.className}HashCodeExtension on $targetName {',
    );

    buffer.writeln('int \$hashCode() =>');
    if (hasSuperAnnotation) {
      for (int i = 0; i < visitor.parameters.length; i++) {
        final String fieldName = visitor.parameters.keys.elementAt(i);
        buffer.write('$fieldName.hashCode');
        if (i != visitor.parameters.length - 1) {
          buffer.write('^');
        } else {
          buffer.write(';');
        }
      }
    } else {
      for (int i = 0; i < visitor.fields.length; i++) {
        final String fieldName = visitor.fields.keys.elementAt(i);
        buffer.write('$fieldName.hashCode');
        if (i != visitor.fields.length - 1) {
          buffer.write('^');
        } else {
          buffer.write(';');
        }
      }
    }

    buffer.writeln('}');
    String result = buffer.toString();
    buffer.clear();
    return result;
  }
}

class HashCodeVisitor extends SimpleElementVisitor<void> {
  HashCodeVisitor(this.fieldsToExclude);

  List<DartObject>? fieldsToExclude;

  late DartType className;
  final Map<String, DartType> parameters = <String, DartType>{};
  final Map<String, DartType> fields = <String, DartType>{};

  @override
  void visitConstructorElement(ConstructorElement element) {
    className = element.type.returnType;
    getParameters(element);
  }

  void getParameters(ConstructorElement element) {
    if (element.enclosingElement3.unnamedConstructor?.parameters != null) {
      List<ParameterElement> params =
          element.enclosingElement3.unnamedConstructor!.parameters;

      for (final ParameterElement param in params) {
        parameters[param.name] = param.type;
      }

      if (fieldsToExclude != null) {
        for (final DartObject param in fieldsToExclude!) {
          parameters.remove(param.toStringValue());
        }
      }
    }
  }

  @override
  void visitFieldElement(FieldElement element) {
    fields[element.name] = element.type;

    // always remove hashCode.
    fields.remove('hashCode');
    if (fieldsToExclude != null) {
      for (final DartObject field in fieldsToExclude!) {
        fields.remove(field.toStringValue());
      }
    }
  }
}
