import 'package:isar/isar.dart';
import 'package:job_timer/app/entities/project_status.dart';

class ProjectStatusConverter extends TypeConverter<ProjectStatus, int> {
  const ProjectStatusConverter();

  @override
  ProjectStatus fromIsar(int object) {
    // TODO: implement fromIsar
    return ProjectStatus.values[object];
  }

  @override
  int toIsar(object) {
    // TODO: implement toIsar
    return object.index;
  }
}
