//
//  RedAPIReader.swift
//  RedditReader
//
//  Created by Moorthy, Prashanth on 11/18/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import Foundation


enum RedditAPIHandler : String{
//    case hot = "listings/hot"
//    case random = "listings/random"
//    case top = "listings/top"
//    case controversial = "listings/controversial"
//    case new = "listings/new"

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
    case mysubredditsmysubreddits
    case mysubreddits_api_v1_me_friends_username
    case mysubreddits_api_v1_me_karma
    case mysubreddits_subreddits_mine_contributor
    case mysubreddits_subreddits_mine_moderator
    case mysubreddits_subreddits_mine_subscriber
    case mysubreddits_subreddits_mine_where
    case mysubredditsprivatemessages
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
    case read_hot
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
    case submitsubmit
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
    case votewikiedit
    case vote_api_wiki_edit
    case wikireadwikiread
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
                            print("This Feed requires user name")
                            
                            
                            RedditAuthHandler.sharedAuthHandler.authorizeUser{(theAccessToken, theUserInfo, theError) in
                                
                                print("The Access Token is .... \(theAccessToken)")
                                print("The User info is .... \(theUserInfo)")
                                print("The Error is .... \(theError)")
                            }

                            
                            RedditAuthHandler.sharedAuthHandler.fetchJSONForURLWithUserAuth(theURL: validURL, completionHandler: { (theJSONResponse) in
                                print("We have a response with Authentication")
                                completionHandler([String:AnyObject]())
                            })
                        } else {
                            // No Auth Required, Go Fetch.
                            print("This Feed DOES NOT NEED.... OAuth")
                            RedditAuthHandler.sharedAuthHandler.fetchJSONForURLNoUserAuthRequired(theURL: validURL, completionHandler: { (theJSONResponse) in
                                print("We have a response with No Authentication")
                                completionHandler([String:AnyObject]())
                            })
                        }

        
            
//            RedditAuthHandler.sharedAuthHandler.fetchJSONForURL(theURL: validURL, completionHandler: { (theResponse) in
//                print("The Response is .... \(theResponse)")
//                completionHandler(theResponse!)
//            })
            
        }
    }
    
//    
//    func fetchJSONForURL(theURL : URL, completionHandler : @escaping (_ result : [String : AnyObject]?) -> ()){
//        
//        var returnDict = [String:AnyObject]()
//        
//        self.authorizeUserPrivate(completionHandler: {
//            
//            // Fetch User Information :
//            
//            self.fetchUseInformation(completionHanlder: {
//                print("User Fetch is complete")
//                var req = self.oauth2.request(forURL: theURL)
//                
//                req.setValue("bearer \(self.oauth2.accessToken!)", forHTTPHeaderField: "Authorization")
//                print("Request Value is : ........................ \(req.value(forHTTPHeaderField: "Authorization"))")
//                
//                let loader = OAuth2DataLoader(oauth2: self.oauth2)
//                
//                loader.perform(request: req) { response in
//                    do {
//                        let dict = try response.responseJSON()
//                        DispatchQueue.main.async {
//                            // you have received `dict` JSON data!
//                            print("We Got the Final Result")
//                            returnDict = dict as [String:AnyObject]
//                            completionHandler(returnDict)
//                        }
//                    }
//                    catch let error {
//                        DispatchQueue.main.async {
//                            // an error occurred
//                            print("Error !!!!! : Unable to fetch the data ---> \(error.localizedDescription) \(error.asOAuth2Error.description)")
//                        }
//                    }
//                }
//            })
//        })
//    }
//
    
    

    private var apiMappingDict : [String : AnyObject?]? {
        if let theFileURL = apiMappingFileURL{
            if let apiMapDict = NSDictionary(contentsOf: theFileURL) as? [String:AnyObject]{
                return apiMapDict
            }
        }
        return nil
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
    
    private func getURL() -> URL? {
        
        if let theApiURL = feedProperties?["apiURL"] as? String{
            return URL(string:(baseURLString + theApiURL))
        }
        
        print("Could not find the URL : Returning Nil")
        return nil
    }
}
