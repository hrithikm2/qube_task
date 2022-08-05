class UserModel {
  final String? status;
  final Data? data;

  UserModel({
    this.status,
    this.data,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson((json['data'] as Map<String, dynamic>))
            : null;

  Map<String, dynamic> toJson() => {'status': status, 'data': data?.toJson()};
}

class Data {
  final FeelingPercentage? feelingPercentage;
  final List<FeelingList>? feelingList;
  final List<VideoArr>? videoArr;

  Data({
    this.feelingPercentage,
    this.feelingList,
    this.videoArr,
  });

  Data.fromJson(Map<String, dynamic> json)
      : feelingPercentage =
            (json['feeling_percentage'] as Map<String, dynamic>?) != null
                ? FeelingPercentage.fromJson(
                    json['feeling_percentage'] as Map<String, dynamic>)
                : null,
        feelingList = (json['feeling_list'] as List?)
            ?.map(
                (dynamic e) => FeelingList.fromJson(e as Map<String, dynamic>))
            .toList(),
        videoArr = (json['video_arr'] as List?)
            ?.map((dynamic e) => VideoArr.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'feeling_percentage': feelingPercentage?.toJson(),
        'feeling_list': feelingList?.map((e) => e.toJson()).toList(),
        'video_arr': videoArr?.map((e) => e.toJson()).toList()
      };
}

class FeelingPercentage {
  final String? happy;
  final String? sad;
  final String? energetic;
  final String? calm;
  final String? angry;
  final String? bored;

  FeelingPercentage({
    this.happy,
    this.sad,
    this.energetic,
    this.calm,
    this.angry,
    this.bored,
  });

  FeelingPercentage.fromJson(Map<String, dynamic> json)
      : happy = json['Happy'] as String?,
        sad = json['Sad'] as String?,
        energetic = json['Energetic'] as String?,
        calm = json['Calm'] as String?,
        angry = json['Angry'] as String?,
        bored = json['Bored'] as String?;

  Map<String, dynamic> toJson() => {
        'Happy': happy,
        'Sad': sad,
        'Energetic': energetic,
        'Calm': calm,
        'Angry': angry,
        'Bored': bored
      };
}

class FeelingList {
  final String? userFeelingId;
  final String? feelingId;
  final String? feelingName;
  final String? submitTime;

  FeelingList({
    this.userFeelingId,
    this.feelingId,
    this.feelingName,
    this.submitTime,
  });

  FeelingList.fromJson(Map<String, dynamic> json)
      : userFeelingId = json['user_feeling_id'] as String?,
        feelingId = json['feeling_id'] as String?,
        feelingName = json['feeling_name'] as String?,
        submitTime = json['submit_time'] as String?;

  Map<String, dynamic> toJson() => {
        'user_feeling_id': userFeelingId,
        'feeling_id': feelingId,
        'feeling_name': feelingName,
        'submit_time': submitTime
      };
}

class VideoArr {
  final String? title;
  final String? description;
  final String? youtubeUrl;

  VideoArr({
    this.title,
    this.description,
    this.youtubeUrl,
  });

  VideoArr.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String?,
        description = json['description'] as String?,
        youtubeUrl = json['youtube_url'] as String?;

  Map<String, dynamic> toJson() =>
      {'title': title, 'description': description, 'youtube_url': youtubeUrl};
}
