
interface IEvent {
    eventName?: string;
    description?: string;
    location?: string;
    dates?: IDates[];
    trr?: string;
    image?: string;
    cardImage?: string;
    workerUsername?: string;
}

interface IDates {
    eventStart?: Date,
    eventEnd?: Date,
    description?: String
}

export class Event {
    public eventName: string | null = null;
    public description: string | null = null;
    public location: string | null = null;
    public dates: IDates[] | null = null;
    public trr: string | null = null;
    public image: string | null = null;
    public cardImage: string | null = null;
    public workerUsername: string | null = null;

    constructor(eventShape: IEvent) {
        if (eventShape.eventName != null) {
            this.eventName = eventShape.eventName;
        }
        if (eventShape.description != null) {
            this.description = eventShape.description;
        }
        if (eventShape.location != null) {
            this.location = eventShape.location;
        }
        if (eventShape.dates != null) {
            this.dates = eventShape.dates;
        }
        if (eventShape.trr != null) {
            this.trr = eventShape.trr;
        }
        if (eventShape.image != null) {
            this.image = eventShape.image;
        }
        if (eventShape.cardImage != null) {
            this.cardImage = eventShape.cardImage;
        }
        if (eventShape.workerUsername != null) {
            this.workerUsername = eventShape.workerUsername;
        }
    }
}