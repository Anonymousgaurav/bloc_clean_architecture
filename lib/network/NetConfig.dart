enum Environments { DEV, PRE, PROD }

const String HERO = "176.31.181.225:8701"; //XXX: dev server
const String HERO_CHALLENGES = "176.31.181.225:8702";
const String HERO_LOGIN = "176.31.181.225:8700";
const String HERO_REGISTER = "176.31.181.225:8704";
const String HERO_MEDIA = "176.31.181.225:8706";
const String STAGE = "34.120.134.39";
const String REAL = "35.190.91.191";
const String REUSABLES = "176.31.181.225:8707";

abstract class Credentials {
  static const String BAH_USER = "";
  static const String BAH_PASS =
      "NjI1YWI4OTFiMWViOWYwOWQ2OTZmMTczNGYyYWE4NTM5YWZjOGRlZTpjOGEyNTJlMmEwZDUxMmMxMTQ5MjJlN2JkYzk2YTJjOWI5YTI3ODVk";
}

abstract class _Endpoints {
  static String CATEGORIES_LIST(String server) =>
      "http://$server/ws-business/securitybah/getallcategories";

  static String BUSSINESS_TYPE_LIST(String server) =>
      "http://$server/ws-business/securitybah/getallbusinesstypes";

  static String BUSINESS_LIST(String server) =>
      "http://$server/ws-business/securitybah/getbusiness";

  static String BUSINESS_CHALLENGE(String server) =>
      "http://$server/ws-business/security/getbusinessesbychallenge";

  static String BUSINESS_DETAIL(String server) =>
      "http://$server/ws-business/securitybah/getbusinessdetail";

  static String BUSINESS_BADGES(String server) =>
      "http://$server/ws-business/securitybah/getallbadges";

  static String BUSINESS_CREATE_OWNER(String server) =>
      "http://$server/ws-business/securitybah/businesscreatenewbusiness";

  static String BUSINESS_CREATE_CLIENT(String server) =>
      "http://$server/ws-business/securitybah/clientcreatenewbusiness";

  static String CHALLENGE_GROUP_LIST(String server) =>
      "http://$server/ws-challenges/securitybah/getchallengegroups";

  static String CHALLENGE_GROUP_DETAIL(String server) =>
      "http://$server/ws-challenges/securitybah/getchallengesgroupdetail";

  static String CHALLENGE_COUNCIL_USER_ACTIVE_LIST(String server) =>
      "http://$server/ws-challenges/security/getchallengegroupsactivatedbyuser";

  static String CHALLENGE_COUNCIL_USER_TOACTIVE_LIST(String server) =>
      "http://$server/ws-challenges/security/getchallengegroupstoactivatebyuser";

  static String CHALLENGE_COUNCIL_USER_CODE_LIST(String server) =>
      "http://$server/ws-challenges/security/getchallengegroupsbycode";

  static String ACTIVATE_CHALLENGE_COUNCIL(String server) =>
      "http://$server/ws-challenges/security/setchallengegroupuser";

  static String PREACTIVATE_CHALLENGE_COUNCIL(String server) =>
      "http://$server/ws-challenges/security/getchallengegrouptoactivate";

  static String DELETE_CAMPAIGN(String server) =>
      "http://$server/ws-challenges/security/deletechallengegroupuser";

  static String HELP(String server) =>
      "http://$server/ws-challenges/securitybah/getsetups";

  static String CHALLENGE_CAROUSEL(String server) =>
      "http://$server/ws-challenges/security/getchallengesbychallengegroup";

  static String CHALLENGE_DETAIL(String server) =>
      "http://$server/ws-challenges/security/getchallengedetail";

  static String CHALLENGE_PLAY(String server) =>
      "http://$server/ws-challenges/security/setchallengeparticipation";

  static String CHALLENGE_SHARE(String server) =>
      "http://$server/ws-challenges/security/shareimagechallengeparticipation";

  static String CHALLENGE_PROFILE(String server) =>
      "http://$server/ws-challenges/security/getglobalstatistics";

  static String FIREBASE_LOGIN(String server) =>
      "http://$server/ws-login/webservice/loginfirebase";

  static String MUST_UPDATE(String server) =>
      "http://$server/ws-login/securitybah/versions/mustupdate";

  static String SET_FIRE_TOKEN(String server) =>
      "http://$server/ws-login/security/setuserfirebasetoken?client=firebase";

  static String SET_USER_LANGUAGE(String server) =>
      "http://$server/ws-login/security/setuserlang?client=firebase";

  static String PROFILE_GDPR_IN(String server) =>
      "http://$server/ws-usermanager/security/getuserinfo";

  static String PROFILE_GDPR_OUT(String server) =>
      "http://$server/ws-usermanager/security/deleteuserinfo";

  static String PROFILE_GET_PROFILE(String server) =>
      "http://$server/ws-usermanager/security/getuserprofile";

  static String PROFILE_SET_PROFILE(String server) =>
      "http://$server/ws-usermanager/security/setuserprofile";

  static String SET_MEDIA(String server) =>
      "http://$server/ws-media/securitybah/media/setdocument";

  static String GET_STATISTICS(String server) =>
      "http://$server/ws-challenges/security/getdetailstatistics?";

  static String GET_BASIC_STATISTICS(String server) =>
      "http://$server/ws-challenges/security/getbasicstatistics?client=firebase";

  static String GET_NEXT_CHALLENGE_GROUPS(String server) =>
      "http://$server/ws-challenges/security/getnextchallengeongroups?client=firebase?";

  static String EXPLORE_CHALLENGES(String server) =>
      "http://$server/ws-challenges/security/getchallengegroupsforuser?client=firebase";

  static String GET_CHALLENGES_ON_GROUP(String server) =>
      "http://$server/ws-challenges/security/getchallengesongroup?client=firebase";

  static String GET_CAMPAIGN_GROUP_STATS(String server) =>
      "http://$server/ws-challenges/security/getchallengegroupstatistics?client=firebase";

  static String GET_CHALLENGE_PARTICIP_GROUP(String server) =>
      "http://$server/ws-challenges/security/getchallengeparticipationsgroup?client=firebase";

  static String GET_MEDIA(String server) =>
      "http://$server/ws-media/securitybah/media/getdocument";

  static String GET_CAMPAIGN_REWARDS(String server) =>
      "http://$server/ws-challenges/security/getnextrewarddate?client=firebase";

  static String GET_CONTAINER_POINT(String server) =>
      "http://$server/ws-reusables/securitybah/GetContainerpoint";
}

/// Network configuration
abstract class NetConfig {
  static Environments env = Environments.DEV;

  static String getCategoryListURL() {
    switch (NetConfig.env) {
      case Environments.PRE:
        return _Endpoints.CATEGORIES_LIST(STAGE);
      case Environments.PROD:
        return _Endpoints.CATEGORIES_LIST(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.CATEGORIES_LIST(HERO);
    }
  }

  static String getBussinessTypeListURL() {
    switch (NetConfig.env) {
      case Environments.PRE:
        return _Endpoints.BUSSINESS_TYPE_LIST(STAGE);
      case Environments.PROD:
        return _Endpoints.BUSSINESS_TYPE_LIST(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.BUSSINESS_TYPE_LIST(HERO);
    }
  }

  static String getStoreListURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.BUSINESS_LIST(STAGE);
      case Environments.PROD:
        return _Endpoints.BUSINESS_LIST(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.BUSINESS_LIST(HERO);
    }
  }

  static String getStoreDetailURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.BUSINESS_DETAIL(STAGE);
      case Environments.PROD:
        return _Endpoints.BUSINESS_DETAIL(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.BUSINESS_DETAIL(HERO);
    }
  }

  static String getBadgesUrl() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.BUSINESS_BADGES(STAGE);
      case Environments.PROD:
        return _Endpoints.BUSINESS_BADGES(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.BUSINESS_BADGES(HERO);
    }
  }

  static String getBusinessClientCreateURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.BUSINESS_CREATE_CLIENT(STAGE);
      case Environments.PROD:
        return _Endpoints.BUSINESS_CREATE_CLIENT(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.BUSINESS_CREATE_CLIENT(HERO);
    }
  }

  static String getBusinessOwnerCreateURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.BUSINESS_CREATE_OWNER(STAGE);
      case Environments.PROD:
        return _Endpoints.BUSINESS_CREATE_OWNER(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.BUSINESS_CREATE_OWNER(HERO);
    }
  }

  static String getSaveTokenUrl() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.SET_FIRE_TOKEN(STAGE);
      case Environments.PROD:
        return _Endpoints.SET_FIRE_TOKEN(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.SET_FIRE_TOKEN(HERO_LOGIN);
    }
  }

  static String getEnvChallengeGroupsURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.CHALLENGE_GROUP_LIST(STAGE);
      case Environments.PROD:
        return _Endpoints.CHALLENGE_GROUP_LIST(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.CHALLENGE_GROUP_LIST(HERO_CHALLENGES);
    }
  }

  static String getEnvChallengeGroupDetailURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.CHALLENGE_GROUP_DETAIL(STAGE);
      case Environments.PROD:
        return _Endpoints.CHALLENGE_GROUP_DETAIL(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.CHALLENGE_GROUP_DETAIL(HERO_CHALLENGES);
    }
  }

  static String getSocialGroupsActivatedURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.CHALLENGE_COUNCIL_USER_ACTIVE_LIST(STAGE);
      case Environments.PROD:
        return _Endpoints.CHALLENGE_COUNCIL_USER_ACTIVE_LIST(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.CHALLENGE_COUNCIL_USER_ACTIVE_LIST(HERO_CHALLENGES);
    }
  }

  static String getSocialGroupsPendingURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.CHALLENGE_COUNCIL_USER_TOACTIVE_LIST(STAGE);
      case Environments.PROD:
        return _Endpoints.CHALLENGE_COUNCIL_USER_TOACTIVE_LIST(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.CHALLENGE_COUNCIL_USER_TOACTIVE_LIST(HERO_CHALLENGES);
    }
  }

  static String activateCampaignURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.ACTIVATE_CHALLENGE_COUNCIL(STAGE);
      case Environments.PROD:
        return _Endpoints.ACTIVATE_CHALLENGE_COUNCIL(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.ACTIVATE_CHALLENGE_COUNCIL(HERO_CHALLENGES);
    }
  }

  static String preactivateSocialChallengeURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.PREACTIVATE_CHALLENGE_COUNCIL(STAGE);
      case Environments.PROD:
        return _Endpoints.PREACTIVATE_CHALLENGE_COUNCIL(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.PREACTIVATE_CHALLENGE_COUNCIL(HERO_CHALLENGES);
    }
  }

  static String deleteCampaignURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.DELETE_CAMPAIGN(STAGE);
      case Environments.PROD:
        return _Endpoints.DELETE_CAMPAIGN(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.DELETE_CAMPAIGN(HERO_CHALLENGES);
    }
  }

  static String carouselURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.CHALLENGE_CAROUSEL(STAGE);
      case Environments.PROD:
        return _Endpoints.CHALLENGE_CAROUSEL(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.CHALLENGE_CAROUSEL(HERO_CHALLENGES);
    }
  }

  static String challengeDetailURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.CHALLENGE_DETAIL(STAGE);
      case Environments.PROD:
        return _Endpoints.CHALLENGE_DETAIL(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.CHALLENGE_DETAIL(HERO_CHALLENGES);
    }
  }

  static String challengePlayURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.CHALLENGE_PLAY(STAGE);
      case Environments.PROD:
        return _Endpoints.CHALLENGE_PLAY(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.CHALLENGE_PLAY(HERO_CHALLENGES);
    }
  }

  static String challengeShareURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.CHALLENGE_SHARE(STAGE);
      case Environments.PROD:
        return _Endpoints.CHALLENGE_SHARE(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.CHALLENGE_SHARE(HERO_CHALLENGES);
    }
  }

  static String challengesCodeURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.CHALLENGE_COUNCIL_USER_CODE_LIST(STAGE);
      case Environments.PROD:
        return _Endpoints.CHALLENGE_COUNCIL_USER_CODE_LIST(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.CHALLENGE_COUNCIL_USER_CODE_LIST(HERO_CHALLENGES);
    }
  }

  static String challengesProfileURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.CHALLENGE_PROFILE(STAGE);
      case Environments.PROD:
        return _Endpoints.CHALLENGE_PROFILE(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.CHALLENGE_PROFILE(HERO_CHALLENGES);
    }
  }

  static String helpURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.HELP(STAGE);
      case Environments.PROD:
        return _Endpoints.HELP(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.HELP(HERO_CHALLENGES);
    }
  }

  static String getFirebaseLoginURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.FIREBASE_LOGIN(STAGE);
      case Environments.PROD:
        return _Endpoints.FIREBASE_LOGIN(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.FIREBASE_LOGIN(HERO_LOGIN);
    }
  }

  static String getMustUpdateUrl() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.MUST_UPDATE(STAGE);
      case Environments.PROD:
        return _Endpoints.MUST_UPDATE(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.MUST_UPDATE(HERO_LOGIN);
    }
  }

  static String getGDPRIn() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.PROFILE_GDPR_IN(STAGE);
      case Environments.PROD:
        return _Endpoints.PROFILE_GDPR_IN(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.PROFILE_GDPR_IN(HERO_REGISTER);
    }
  }

  static String getGDPROut() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.PROFILE_GDPR_OUT(STAGE);
      case Environments.PROD:
        return _Endpoints.PROFILE_GDPR_OUT(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.PROFILE_GDPR_OUT(HERO_REGISTER);
    }
  }

  static String getProfileGet() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.PROFILE_GET_PROFILE(STAGE);
      case Environments.PROD:
        return _Endpoints.PROFILE_GET_PROFILE(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.PROFILE_GET_PROFILE(HERO_REGISTER);
    }
  }

  static String getProfileSet() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.PROFILE_SET_PROFILE(STAGE);
      case Environments.PROD:
        return _Endpoints.PROFILE_SET_PROFILE(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.PROFILE_SET_PROFILE(HERO_REGISTER);
    }
  }

  static String getSetMediaURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.SET_MEDIA(STAGE);
      case Environments.PROD:
        return _Endpoints.SET_MEDIA(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.SET_MEDIA(HERO_MEDIA);
    }
  }

  static String getBussinessForChallengeURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.BUSINESS_CHALLENGE(STAGE);
      case Environments.PROD:
        return _Endpoints.BUSINESS_CHALLENGE(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.BUSINESS_CHALLENGE(HERO);
    }
  }

  static String getStatisticsChallenge() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.GET_STATISTICS(STAGE);
      case Environments.PROD:
        return _Endpoints.GET_STATISTICS(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.GET_STATISTICS(HERO_CHALLENGES);
    }
  }

  static String getSetUserLanguageURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.SET_USER_LANGUAGE(STAGE);
      case Environments.PROD:
        return _Endpoints.SET_USER_LANGUAGE(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.SET_USER_LANGUAGE(HERO_LOGIN);
    }
  }

  static String getBasicStatistics() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.GET_BASIC_STATISTICS(STAGE);
      case Environments.PROD:
        return _Endpoints.GET_BASIC_STATISTICS(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.GET_BASIC_STATISTICS(HERO_CHALLENGES);
    }
  }

  static String getNextChallengeOnGroups() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.GET_NEXT_CHALLENGE_GROUPS(STAGE);
      case Environments.PROD:
        return _Endpoints.GET_NEXT_CHALLENGE_GROUPS(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.GET_NEXT_CHALLENGE_GROUPS(HERO_CHALLENGES);
    }
  }

  static String getExploreChallenges() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.EXPLORE_CHALLENGES(STAGE);
      case Environments.PROD:
        return _Endpoints.EXPLORE_CHALLENGES(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.EXPLORE_CHALLENGES(HERO_CHALLENGES);
    }
  }

  static String getChallengesOnGroup() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.GET_CHALLENGES_ON_GROUP(STAGE);
      case Environments.PROD:
        return _Endpoints.GET_CHALLENGES_ON_GROUP(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.GET_CHALLENGES_ON_GROUP(HERO_CHALLENGES);
    }
  }

  static String challengeGroupStatistics() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.GET_CAMPAIGN_GROUP_STATS(STAGE);
      case Environments.PROD:
        return _Endpoints.GET_CAMPAIGN_GROUP_STATS(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.GET_CAMPAIGN_GROUP_STATS(HERO_CHALLENGES);
    }
  }

  static String getChallengeGroupParticipation() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.GET_CHALLENGE_PARTICIP_GROUP(STAGE);
      case Environments.PROD:
        return _Endpoints.GET_CHALLENGE_PARTICIP_GROUP(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.GET_CHALLENGE_PARTICIP_GROUP(HERO_CHALLENGES);
    }
  }

  static String getMediaURL() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.GET_MEDIA(STAGE);
      case Environments.PROD:
        return _Endpoints.GET_MEDIA(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.GET_MEDIA(HERO_MEDIA);
    }
  }

  static String getCampaignRewards() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.GET_CAMPAIGN_REWARDS(STAGE);
      case Environments.PROD:
        return _Endpoints.GET_CAMPAIGN_REWARDS(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.GET_CAMPAIGN_REWARDS(HERO_CHALLENGES);
    }
  }

  static String getContainerPoint() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.GET_CONTAINER_POINT(STAGE);
      case Environments.PROD:
        return _Endpoints.GET_CONTAINER_POINT(REAL);
      case Environments.DEV:
      default:
        return _Endpoints.GET_CONTAINER_POINT(HERO_CHALLENGES);
    }
  }
}
