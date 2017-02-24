//
//  RedAPIReader.swift
//  RedditReader
//
//  Created by Moorthy, Prashanth on 11/18/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import Foundation


enum RedditAPIHandler{
    
    case none_api_comment
    case none_api_friend
    case none_api_needs_captcha
    case none_api_unfriend
    case none_api_v1_scopes
    case account_api_v1_me_prefs
    case creddits_api_v1_gold_gild_fullname
    case creddits_api_v1_gold_give_username
    case edit_api_del
    case edit_api_editusertext
    case edit_api_live_thread_delete_update
    case edit_api_live_thread_strike_update
    case edit_api_sendreplies
    case flair_api_flairselector
    case flair_api_selectflair
    case flair_api_setflairenabled
    case history_user_username_comments
    case history_user_username_downvoted
    case history_user_username_gilded
    case history_user_username_hidden
    case history_user_username_overview
    case history_user_username_saved
    case history_user_username_submitted
    case history_user_username_upvoted
    case history_user_username_where
    case identity_api_v1_me
    case identity_api_v1_me_prefs
    case identity_api_v1_me_trophies
    case livemanage_api_live_thread_accept_contributor_invite
    case livemanage_api_live_thread_close_thread
    case livemanage_api_live_thread_edit
    case livemanage_api_live_thread_invite_contributor
    case livemanage_api_live_thread_leave_contributor
    case livemanage_api_live_thread_rm_contributor
    case livemanage_api_live_thread_rm_contributor_invite
    case livemanage_api_live_thread_set_contributor_permissions
    case mysubreddits_api_v1_me_friends_username
    case mysubreddits_api_v1_me_karma
    case mysubreddits_subreddits_mine_contributor
    case mysubreddits_subreddits_mine_moderator
    case mysubreddits_subreddits_mine_subscriber
    case mysubreddits_subreddits_mine_where
    case mysubreddits_api_block
    case mysubreddits_api_compose
    case mysubreddits_api_del_msg
    case mysubreddits_api_read_all_messages
    case mysubreddits_api_read_message
    case mysubreddits_api_unblock_subreddit
    case mysubreddits_api_unread_message
    case mysubreddits_message_inbox
    case mysubreddits_message_sent
    case mysubreddits_message_unread
    case mysubreddits_message_where
    case read_about_banned
    case read_about_contributors
    case read_about_edited
    case read_about_moderators
    case read_about_modqueue
    case read_about_muted
    case read_about_reports
    case read_about_spam
    case read_about_unmoderated
    case read_about_wikibanned
    case read_about_wikicontributors
    case read_about_location
    case read_about_where
    case read_api_filter_filterpath
    case read_api_filter_filterpath_r_srname
    case read_api_info
    case read_api_live_happening_now
    case read_api_morechildren
    case read_api_multi_mine
    case read_api_multi_user_username
    case read_api_multi_multipath
    case read_api_multi_multipath_description
    case read_api_multi_multipath_r_srname
    case read_api_recommend_sr_srnames
    case read_api_search_reddit_names
    case read_api_subreddits_by_topic
    case read_api_v1_me_blocked
    case read_api_v1_me_friends
    case read_api_v1_user_username_trophies
    case read_by_id_names
    case read_comments_article
    case read_controversial
    case read_duplicates_article
    case read_hot (after : String?, before: String?, count : Int?, limit : Int?, show : String?, sr_detail : Bool?)
    case read_live_thread
    case read_live_thread_about
    case read_live_thread_contributors
    case read_live_thread_discussions
    case read_new
    case read_prefs_blocked
    case read_prefs_friends
    case read_prefs_where
    case read_r_subreddit_about
    case read_random
    case read_rules
    case read_search
    case read_sidebar
    case read_sticky
    case read_subreddits_default
    case read_subreddits_gold
    case read_subreddits_new
    case read_subreddits_popular
    case read_subreddits_search
    case read_subreddits_where
    case read_top
    case read_user_username_about
    case read_sort
    case readreport
    case read_api_hide
    case read_api_live_thread_report
    case read_api_report
    case read_api_unhide
    case save_api_save
    case save_api_saved_categories
    case save_api_store_visits
    case save_api_unsave
    case submit_api_live_create
    case submit_api_live_thread_update
    case submit_api_submit
    case submit_api_submit_text
    case subscribe_api_filter_filterpath
    case subscribe_api_filter_filterpath_r_srname
    case subscribe_api_multi_copy
    case subscribe_api_multi_rename
    case subscribe_api_multi_multipath
    case subscribe_api_multi_multipath_r_srname
    case subscribe_api_subscribe
    case subscribe_api_v1_me_friends_username
    case vote_api_vote
    case vote_api_wiki_edit
    case wikiread_wiki_discussions_page
    case wikiread_wiki_pages
    case wikiread_wiki_revisions
    case wikiread_wiki_revisions_page
    case wikiread_wiki_page
    
    
    
    
    func fetchData(sender : AnyObject, completionHandler : @escaping (_ theResponse : [String:AnyObject?]) -> ()) {
        
        if let validURL = self.getURL(){
            print("We have a valid URL........... \(validURL)")
            
            // Only if user api requires OAuth, request for credentials. (Remeber most users might be Anonymous)
            if isAuthRequired == true{
                print("This Feed requires OAuth")
                // Request for Authorization before fetching.
                // Step 1 : Fetch User information (name, etc)
                
                RedditAuthHandler.sharedAuthHandler.fetchJSONForURLWithUserAuth(theURL: validURL, requiresUserName: isUserNameRequired, completionHandler: { (theJSONResponse,theUserInfo) in
                    print("We have a response with Authentication")
                    if let validJSONResponse = theJSONResponse{
                        completionHandler(validJSONResponse)
                    } else{
                        completionHandler([String:AnyObject?]())
                    }
                })
            } else {
                // No Auth Required, Go Fetch.
                print("This Feed DOES NOT NEED.... OAuth")
                RedditAuthHandler.sharedAuthHandler.fetchJSONForURLNoUserAuthRequired(theURL: validURL, completionHandler: { (theJSONResponse) in
                    print("We have a response with No Authentication")
                    completionHandler([String:AnyObject]())
                })
            }
        }
    }
    
    
    
    private func getURL() -> URL? {
        
        if let theApiURL = feedProperties?["apiURL"] as? String{
            print("Additional URL String is ...... \(generateAdditionalURLParamters())")
            let additionalParms = generateAdditionalURLParamters()
            
            print("Final String : \(baseURLString + theApiURL + additionalParms!)")
            
            return URL(string:(baseURLString + theApiURL + additionalParms! ))
        }
        print("Could not find the URL : Returning Nil")
        return nil
    }
    
    
    
    private func generateAdditionalURLParamters() -> String?{
        
        var tempParmString = "/?"
        
        switch self {
        case let .read_hot(after,before,count,theLimit,show,sr_detail):
            
            if let validLimit = theLimit{
                tempParmString += "limit=\(validLimit)"
                print("The Limit is \(validLimit)")
            }
            
            if let hasAfter = after{
                tempParmString += "/after=\(hasAfter)"
            }

            if let hasBefore = before{
                tempParmString += "/before=\(hasBefore)"
            }

            return tempParmString
            
        default:
            return tempParmString
        }
    }
    
    
    
    var rawValue : String {
        switch self {
        case .none_api_comment :            return "none_api_comment"
        case .none_api_friend :             return "none_api_friend"
        case .none_api_needs_captcha :      return "none_api_needs_captcha"
        case .none_api_unfriend :           return "none_api_unfriend"
        case .none_api_v1_scopes :          return "none_api_v1_scopes"
        case .account_api_v1_me_prefs :     return "account_api_v1_me_prefs"
        case .creddits_api_v1_gold_gild_fullname :  return "creddits_api_v1_gold_gild_fullname"
        case .creddits_api_v1_gold_give_username :  return "creddits_api_v1_gold_give_username"
        case .edit_api_del :  return "edit_api_del"
        case .edit_api_editusertext :  return "edit_api_editusertext"
        case .edit_api_live_thread_delete_update :  return "edit_api_live_thread_delete_update"
        case .edit_api_live_thread_strike_update :  return "edit_api_live_thread_strike_update"
        case .edit_api_sendreplies :  return "edit_api_sendreplies"
        case .flair_api_flairselector :  return "flair_api_flairselector"
        case .flair_api_selectflair :  return "flair_api_selectflair"
        case .flair_api_setflairenabled :  return "flair_api_setflairenabled"
        case .history_user_username_comments :  return "history_user_username_comments"
        case .history_user_username_downvoted :  return "history_user_username_downvoted"
        case .history_user_username_gilded :  return "history_user_username_gilded"
        case .history_user_username_hidden :  return "history_user_username_hidden"
        case .history_user_username_overview :  return "history_user_username_overview"
        case .history_user_username_saved :  return "history_user_username_saved"
        case .history_user_username_submitted :  return "history_user_username_submitted"
        case .history_user_username_upvoted :  return "history_user_username_upvoted"
        case .history_user_username_where :  return "history_user_username_where"
        case .identity_api_v1_me :  return "identity_api_v1_me"
        case .identity_api_v1_me_prefs :  return "identity_api_v1_me_prefs"
        case .identity_api_v1_me_trophies :  return "identity_api_v1_me_trophies"
        case .livemanage_api_live_thread_accept_contributor_invite :  return "livemanage_api_live_thread_accept_contributor_invite"
        case .livemanage_api_live_thread_close_thread :  return "livemanage_api_live_thread_close_thread"
        case .livemanage_api_live_thread_edit :  return "livemanage_api_live_thread_edit"
        case .livemanage_api_live_thread_invite_contributor :  return "livemanage_api_live_thread_invite_contributor"
        case .livemanage_api_live_thread_leave_contributor :  return "livemanage_api_live_thread_leave_contributor"
        case .livemanage_api_live_thread_rm_contributor :  return "livemanage_api_live_thread_rm_contributor"
        case .livemanage_api_live_thread_rm_contributor_invite :  return "livemanage_api_live_thread_rm_contributor_invite"
        case .livemanage_api_live_thread_set_contributor_permissions :  return "livemanage_api_live_thread_set_contributor_permissions"
        case .mysubreddits_api_v1_me_friends_username :  return "mysubreddits_api_v1_me_friends_username"
        case .mysubreddits_api_v1_me_karma :  return "mysubreddits_api_v1_me_karma"
        case .mysubreddits_subreddits_mine_contributor :  return "mysubreddits_subreddits_mine_contributor"
        case .mysubreddits_subreddits_mine_moderator :  return "mysubreddits_subreddits_mine_moderator"
        case .mysubreddits_subreddits_mine_subscriber :  return "mysubreddits_subreddits_mine_subscriber"
        case .mysubreddits_subreddits_mine_where :  return "mysubreddits_subreddits_mine_where"
        case .mysubreddits_api_block :  return "mysubreddits_api_block"
        case .mysubreddits_api_compose :  return "mysubreddits_api_compose"
        case .mysubreddits_api_del_msg :  return "mysubreddits_api_del_msg"
        case .mysubreddits_api_read_all_messages :  return "mysubreddits_api_read_all_messages"
        case .mysubreddits_api_read_message :  return "mysubreddits_api_read_message"
        case .mysubreddits_api_unblock_subreddit :  return "mysubreddits_api_unblock_subreddit"
        case .mysubreddits_api_unread_message :  return "mysubreddits_api_unread_message"
        case .mysubreddits_message_inbox :  return "mysubreddits_message_inbox"
        case .mysubreddits_message_sent :  return "mysubreddits_message_sent"
        case .mysubreddits_message_unread :  return "mysubreddits_message_unread"
        case .mysubreddits_message_where :  return "mysubreddits_message_where"
        case .read_about_banned :  return "read_about_banned"
        case .read_about_contributors :  return "read_about_contributors"
        case .read_about_edited :  return "read_about_edited"
        case .read_about_moderators :  return "read_about_moderators"
        case .read_about_modqueue :  return "read_about_modqueue"
        case .read_about_muted :  return "read_about_muted"
        case .read_about_reports :  return "read_about_reports"
        case .read_about_spam :  return "read_about_spam"
        case .read_about_unmoderated :  return "read_about_unmoderated"
        case .read_about_wikibanned :  return "read_about_wikibanned"
        case .read_about_wikicontributors :  return "read_about_wikicontributors"
        case .read_about_location :  return "read_about_location"
        case .read_about_where :  return "read_about_where"
        case .read_api_filter_filterpath :  return "read_api_filter_filterpath"
        case .read_api_filter_filterpath_r_srname :  return "read_api_filter_filterpath_r_srname"
        case .read_api_info :  return "read_api_info"
        case .read_api_live_happening_now :  return "read_api_live_happening_now"
        case .read_api_morechildren :  return "read_api_morechildren"
        case .read_api_multi_mine :  return "read_api_multi_mine"
        case .read_api_multi_user_username :  return "read_api_multi_user_username"
        case .read_api_multi_multipath :  return "read_api_multi_multipath"
        case .read_api_multi_multipath_description :  return "read_api_multi_multipath_description"
        case .read_api_multi_multipath_r_srname :  return "read_api_multi_multipath_r_srname"
        case .read_api_recommend_sr_srnames :  return "read_api_recommend_sr_srnames"
        case .read_api_search_reddit_names :  return "read_api_search_reddit_names"
        case .read_api_subreddits_by_topic :  return "read_api_subreddits_by_topic"
        case .read_api_v1_me_blocked :  return "read_api_v1_me_blocked"
        case .read_api_v1_me_friends :  return "read_api_v1_me_friends"
        case .read_api_v1_user_username_trophies :  return "read_api_v1_user_username_trophies"
        case .read_by_id_names :  return "read_by_id_names"
        case .read_comments_article :  return "read_comments_article"
        case .read_controversial :  return "read_controversial"
        case .read_duplicates_article :  return "read_duplicates_article"
        case .read_hot :  return "read_hot"
        case .read_live_thread :  return "read_live_thread"
        case .read_live_thread_about :  return "read_live_thread_about"
        case .read_live_thread_contributors :  return "read_live_thread_contributors"
        case .read_live_thread_discussions :  return "read_live_thread_discussions"
        case .read_new :  return "read_new"
        case .read_prefs_blocked :  return "read_prefs_blocked"
        case .read_prefs_friends :  return "read_prefs_friends"
        case .read_prefs_where :  return "read_prefs_where"
        case .read_r_subreddit_about :  return "read_r_subreddit_about"
        case .read_random :  return "read_random"
        case .read_rules :  return "read_rules"
        case .read_search :  return "read_search"
        case .read_sidebar :  return "read_sidebar"
        case .read_sticky :  return "read_sticky"
        case .read_subreddits_default :  return "read_subreddits_default"
        case .read_subreddits_gold :  return "read_subreddits_gold"
        case .read_subreddits_new :  return "read_subreddits_new"
        case .read_subreddits_popular :  return "read_subreddits_popular"
        case .read_subreddits_search :  return "read_subreddits_search"
        case .read_subreddits_where :  return "read_subreddits_where"
        case .read_top :  return "read_top"
        case .read_user_username_about :  return "read_user_username_about"
        case .read_sort :  return "read_sort"
        case .readreport :  return "readreport"
        case .read_api_hide :  return "read_api_hide"
        case .read_api_live_thread_report :  return "read_api_live_thread_report"
        case .read_api_report :  return "read_api_report"
        case .read_api_unhide :  return "read_api_unhide"
        case .save_api_save :  return "save_api_save"
        case .save_api_saved_categories :  return "save_api_saved_categories"
        case .save_api_store_visits :  return "save_api_store_visits"
        case .save_api_unsave :  return "save_api_unsave"
        case .submit_api_live_create :  return "submit_api_live_create"
        case .submit_api_live_thread_update :  return "submit_api_live_thread_update"
        case .submit_api_submit :  return "submit_api_submit"
        case .submit_api_submit_text :  return "submit_api_submit_text"
        case .subscribe_api_filter_filterpath :  return "subscribe_api_filter_filterpath"
        case .subscribe_api_filter_filterpath_r_srname :  return "subscribe_api_filter_filterpath_r_srname"
        case .subscribe_api_multi_copy :  return "subscribe_api_multi_copy"
        case .subscribe_api_multi_rename :  return "subscribe_api_multi_rename"
        case .subscribe_api_multi_multipath :  return "subscribe_api_multi_multipath"
        case .subscribe_api_multi_multipath_r_srname :  return "subscribe_api_multi_multipath_r_srname"
        case .subscribe_api_subscribe :  return "subscribe_api_subscribe"
        case .subscribe_api_v1_me_friends_username :  return "subscribe_api_v1_me_friends_username"
        case .vote_api_vote :                   return "vote_api_vote"
        case .vote_api_wiki_edit :              return "vote_api_wiki_edit"
        case .wikiread_wiki_discussions_page :  return "wikiread_wiki_discussions_page"
        case .wikiread_wiki_pages :             return "wikiread_wiki_pages"
        case .wikiread_wiki_revisions :         return "wikiread_wiki_revisions"
        case .wikiread_wiki_revisions_page :    return "wikiread_wiki_revisions_page"
        case .wikiread_wiki_page :              return "wikiread_wiki_page"
        }
    }
    
    
    
    
    
    
    private var apiMappingDict : [String : AnyObject?]? {
        if let theFileURL = apiMappingFileURL{
            if let apiMapDict = NSDictionary(contentsOf: theFileURL) as? [String:AnyObject]{
                return apiMapDict
            }
        }
        return nil
    }
    
    private var fetchLimit : Int{
        return 10
    }
    
    private var limitParamterForURL : String{
        
        var additionalParmString : String = ""
        
        additionalParmString + "/limit=\(fetchLimit)"
        
        return additionalParmString
    }
    
    private var baseURLString : String {
        return "https://oauth.reddit.com/"
    }
    
    private var filePath : String{
        return ""
    }
    
    private var apiMappingFileURL : URL?{
        let bundlefilePath = Bundle.main.url(forResource: "RedditApiLookup", withExtension: "plist")
        return bundlefilePath
    }
    
    private var feedProperties : [String : AnyObject?]?{
        if let feedPropertiesDict = apiMappingDict?[self.rawValue] as? [String:AnyObject?]{
            return feedPropertiesDict
        }
        return nil
    }
    
    private var isAuthRequired : Bool{
        if let needsAuth = feedProperties?["NeedsAuth"] as? Bool{
            return needsAuth
        }
        return false
    }
    
    private var isUserNameRequired : Bool{
        if let needsUserName = feedProperties?["NeedsUserName"] as? Bool{
            return needsUserName
        }
        return false
    }
}
