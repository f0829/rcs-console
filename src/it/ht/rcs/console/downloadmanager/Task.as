package it.ht.rcs.console.downloadmanager
{
  import flash.events.Event;
  import flash.events.EventDispatcher;
  import flash.net.URLStream;
  
  [Bindable(event="percentageChanged")]
  public class Task extends EventDispatcher
  {
    public function Task() 
    {

    }
    
    [Bindable]
    public var title:String;
    [Bindable]
    public var time:String;
    [Bindable]
    public var creation_undefined:Boolean = true;
    
    [Bindable(event="percentageChanged")]
    public var creation_percentage:Object = {bytesLoaded:0, bytesTotal:0};
    [Bindable(event="percentageChanged")]
    public var download_percentage:Object = {bytesLoaded:0, bytesTotal:0};
    
    
    //public var stream : URLStream;

    public function set_creation_size(total:Number):void 
    {
      creation_percentage.bytesTotal = total;
      creation_undefined = false;
    }

    public function set_download_size(total:Number):void 
    {
      download_percentage.bytesTotal = total;
    }
    
    public function update_creation(cur:Number):void 
    {
      creation_percentage.bytesLoaded = cur;
      dispatchEvent(new Event("percentageChanged"));
    }
    
    public function update_download(cur:Number):void 
    {
      download_percentage.bytesLoaded = cur;
      dispatchEvent(new Event("percentageChanged"));
    }
    
    public function complete():void 
    {
    }
    
    public function cancel():void 
    {
      //stream.close();
      //stream.dispatchEvent(new Event("closed"));
      DownloadManager.instance.removeTask(this);
    }
    
  }
}